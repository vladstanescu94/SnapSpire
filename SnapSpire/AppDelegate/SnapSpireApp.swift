import SwiftUI

@main
struct SnapSpireApp: App {
    @State var isShowingSplash: Bool = true
    @StateObject private var purchaseManager = PurchaseManager()

    var body: some Scene {
        WindowGroup {
            if isShowingSplash {
                SplashView(isShowingSplash: $isShowingSplash)
            } else {
                ContentView()
                    .environmentObject(purchaseManager)
                    .task {
                        await purchaseManager.updatePurchasedProducts()
                    }
            }
        }
    }
}
