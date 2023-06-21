import SwiftUI

@main
struct SnapSpireApp: App {
    @State var isShowingSplash: Bool = true
    @StateObject private var purchaseManager: PurchaseManager
    @StateObject private var entitledManager: EntitlementManager

    init() {
        let entitlementManager = EntitlementManager()
        let purchaseManager = PurchaseManager(entitlementManager: entitlementManager)

        _entitledManager = StateObject(wrappedValue: entitlementManager)
        _purchaseManager = StateObject(wrappedValue: purchaseManager)
    }

    var body: some Scene {
        WindowGroup {
            if isShowingSplash {
                SplashView(isShowingSplash: $isShowingSplash)
            } else {
                ContentView()
                    .environmentObject(entitledManager)
                    .environmentObject(purchaseManager)
                    .task {
                        await purchaseManager.updatePurchasedProducts()
                    }
            }
        }
    }
}
