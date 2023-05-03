import StoreKit
import SwiftUI

struct PurchaseView: View {
    private let productIds = ["pro_yearly", "pro_lifetime"]
    @StateObject var viewModel = PurchaseManager()
    @State var products: [Product] = []

    var body: some View {
        VStack(spacing: 20) {
            Text("Products")
            ForEach(products) { product in
                Button {
                    Task {
                        try await viewModel.purchase(product)
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
                try await viewModel.loadProduct()
            } catch {
                print(error)
            }
        }
    }
}
