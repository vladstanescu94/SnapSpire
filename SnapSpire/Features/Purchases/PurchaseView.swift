import StoreKit
import SwiftUI

struct PurchaseView: View {
    @EnvironmentObject private var purchaseManager: PurchaseManager

    var body: some View {
        VStack(spacing: 20) {
            Text("Products")
            ForEach(purchaseManager.products) { product in
                Button {
                    Task {
                        try await purchaseManager.purchase(product)
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
                try await purchaseManager.loadProduct()
            } catch {
                print(error)
            }
        }
    }
}
