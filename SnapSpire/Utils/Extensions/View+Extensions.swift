import SwiftUI

extension View {
    func customFont(font: GeneralFonts = .RubikRegular, size: CGFloat = 14) -> some View {
        modifier(CustomFont(font: font, size: size))
    }
}
