import StoreKit
import SwiftUI

struct PurchaseView: View {
    private let productIds = ["pro_yearly", "pro_lifetime"]
    @State var products: [Product] = []

    var body: some View {
        VStack {
            Text("Products")

            ForEach(products) { product in
                Button {
                    // action
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
}

struct PurchaseView_Previews: PreviewProvider {
    static var previews: some View {
        PurchaseView()
    }
}
