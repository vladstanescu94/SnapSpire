import SwiftUI

enum GeneralFonts: String {
    case rubikBold = "Rubik-Bold"
    case rubikItalic = "Rubik-Italic"
    case rubikLight = "Rubik-Light"
    case rubikRegular = "Rubik-Regular"
    case rubikSemiBold = "Rubik-SemiBold"
}

struct CustomFont: ViewModifier {
    var font: GeneralFonts
    var size: CGFloat

    func body(content: Content) -> some View {
        content.font(.custom(font.rawValue, size: size))
    }
}
