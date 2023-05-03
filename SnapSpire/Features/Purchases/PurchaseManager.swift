import Foundation
import StoreKit

 @MainActor
class PurchaseManager: ObservableObject {
    private let productIds = ["pro_yearly", "pro_lifetime"]

    @Published var products: [Product] = []
    @Published var isProductsLoaded: Bool = false

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
}
