import StoreKit
import SwiftUI

struct PurchaseView: View {
    @EnvironmentObject private var purchaseManager: PurchaseManager
    @EnvironmentObject private var entitlementManager: EntitlementManager

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                if entitlementManager.hasPro {
                    Text("Thank you for purchasing pro!")
                } else {
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
                }

                Button {
                    Task {
                        try await AppStore.sync()
                    }
                } label: {
                    Text("Restore Purchases")
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
}
