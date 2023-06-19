import SwiftUI

struct CardView: View {
    var image: String
    var name: String
    var imageWidth: CGFloat?
    var imageHeight: CGFloat?
    var type: ImageType?

    var body: some View {
        ZStack {
            Image(image)
                .resizable()
                .frame(width: imageWidth, height: imageHeight)
                .cornerRadius(10)

            Text(name.uppercased())
                .customFont(font: .rubikBold)
                .foregroundColor(.white)
        }
    }
}
