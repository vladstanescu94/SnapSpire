import SwiftUI

struct View3: View {
    var body: some View {
        ZStack {
            Color.white

            Text("Hello, third View!")
        }.ignoresSafeArea()
    }
}

struct View3_Previews: PreviewProvider {
    static var previews: some View {
        View3()
    }
}
