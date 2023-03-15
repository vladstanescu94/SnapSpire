import SwiftUI

struct SplashView: View {
    private let splashVerticalOffset: CGFloat = -80

    var body: some View {
        ZStack {
            Image("splashBackground")
                .resizable()
                .ignoresSafeArea()

            VStack {
                Image("AppLogo")
                Image("splashHero")
            }.offset(y: splashVerticalOffset)
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
