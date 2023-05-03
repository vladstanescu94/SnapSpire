import StoreKit
import SwiftUI

struct PurchaseView: View {
    private let productIds = ["pro_yearly", "pro_lifetime"]
    @State var products: [Product] = []

    var body: some View {
        ForEach(products) { product in
            VStack {
                Text("Products")

                Button {
                    // acion
                } label: {
                    Text("\(product.displayPrice) - \(product.displayName)")
                        .foregroundColor(.white)
                        .padding()
                        .background(.blue)
                        .clipShape(Capsule())
                }
            }
        }
    }
}

struct PurchaseView_Previews: PreviewProvider {
    static var previews: some View {
        PurchaseView()
    }
}
