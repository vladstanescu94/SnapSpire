import SwiftUI

enum GeneralFonts: String {
    case RubikBold = "Rubik-Bold"
    case RubikItalic = "Rubik-Italic"
    case RubikLight = "Rubik-Light"
    case RubikRegular = "Rubik-Regular"
    case RubikSemiBold = "Rubik-SemiBold"
}

struct CustomFont: ViewModifier {
    var font: GeneralFonts
    var size: CGFloat

    func body(content: Content) -> some View {
        content.font(.custom(font.rawValue, size: size))
    }
}
