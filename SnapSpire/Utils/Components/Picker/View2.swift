import SwiftUI

struct View2: View {
    var body: some View {
        ZStack {
            Color.cyan

            Text("Hello, second View!")
        }.ignoresSafeArea()
    }
}

struct View2_Previews: PreviewProvider {
    static var previews: some View {
        View2()
    }
}
