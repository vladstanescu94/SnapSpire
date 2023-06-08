import SwiftUI

struct TopicView: View {
    var image: String
    var name: String

    var body: some View {
        ZStack {
            Image(image)
                .cornerRadius(10)

            Text(name.uppercased())
                .customFont(font: .rubikBold)
                .foregroundColor(.white)
        }
    }
}

struct TopicView_Previews: PreviewProvider {
    static var previews: some View {
        TopicView(image: "photography", name: "photography")
    }
}
