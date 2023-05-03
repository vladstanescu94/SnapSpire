import StoreKit
import SwiftUI

struct PurchaseView: View {
    private let productIds = ["pro_yearly", "pro_lifetime"]
    @State var products: [Product] = []

    var body: some View {
        VStack(spacing: 20) {
            Text("Products")
            ForEach(products) { product in
                Button {
                    Task {
                        try await purchase(product)
                    }
                } label: {
                    Text("\(product.displayPrice) - \(product.displayName)")
                        .foregroundColor(.white)
                        .padding()
                        .background(.blue)
                        .clipShape(Capsule())
                }
            }
        }.task {
            do {
                try await loadProducts()
            } catch {
                print(error)
            }
        }
    }

    private func loadProducts() async throws {
        // Products are not returned in the order the ids are requested
        products = try await Product.products(for: productIds)
    }

    private func purchase(_ product: Product) async throws {
        let result = try await product.purchase()

        switch result {
        case let .success(.verified(transaction)):
            await transaction.finish()
        case .success(.unverified(_, _)):
            break
        case .pending:
            break
        case .userCancelled:
            break
        @unknown default:
            break
        }
    }
}
