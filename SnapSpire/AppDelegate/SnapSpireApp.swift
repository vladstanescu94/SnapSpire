import SwiftUI

@main
struct SnapSpireApp: App {
    @State var isShowingSplash: Bool = true

    var body: some Scene {
        WindowGroup {
            if isShowingSplash {
                SplashView(isShowingSplash: $isShowingSplash)
            } else {
                ContentView()
            }
        }
    }
}
