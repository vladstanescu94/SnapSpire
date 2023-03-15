import SwiftUI

struct SplashView: View {
    @Binding var isShowingSplash: Bool
    private let splashVerticalOffset: CGFloat = -80

    var body: some View {
        ZStack {
            Image("splashBackground")
                .resizable()
                .ignoresSafeArea()

            VStack {
                Image("AppLogo")
                Image("splashHero")
            }
            .offset(y: splashVerticalOffset)
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                withAnimation {
                    isShowingSplash = false
                }
            }
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView(isShowingSplash: .constant(true))
    }
}
