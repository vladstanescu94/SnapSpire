import Foundation
import StoreKit

@MainActor
class PurchaseManager: ObservableObject {
    private let productIds = ["pro_yearly", "pro_lifetime"]

    @Published var products: [Product] = []
    @Published var isProductsLoaded: Bool = false
    @Published var purchasedProductIDs = Set<String>()

    private var updates: Task<Void, Never>?

    init() {
        updates = observeTransactionUpdates()
    }

    deinit {
        updates?.cancel()
    }

    var hasUnlockedPro: Bool {
        !purchasedProductIDs.isEmpty
    }

    func loadProduct() async throws {
        guard !isProductsLoaded else { return }
        products = try await Product.products(for: productIds)
        isProductsLoaded = true
    }

    func purchase(_ product: Product) async throws {
        let result = try await product.purchase()

        switch result {
        case let .success(.verified(transaction)):
            await transaction.finish()
            await updatePurchasedProducts()
        case .success(.unverified(_, _)):
            break
        case .userCancelled:
            break
        case .pending:
            break
        @unknown default:
            break
        }
    }

    func updatePurchasedProducts() async {
        for await result in Transaction.currentEntitlements {
            guard case let .verified(transaction) = result else {
                continue
            }

            if transaction.revocationDate == nil {
                purchasedProductIDs.insert(transaction.productID)
            } else {
                purchasedProductIDs.remove(transaction.productID)
            }
        }
    }

    private func observeTransactionUpdates() -> Task<Void, Never> {
        Task(priority: .background) {
            for await verificationResult in Transaction.updates {
                print(verificationResult)
                // Using verificationResult directly would be better
                // but this way works for this tutorial
                await self.updatePurchasedProducts()
            }
        }
    }
}
