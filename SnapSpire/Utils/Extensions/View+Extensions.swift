import SwiftUI

extension View {
    func customFont(font: GeneralFonts = .rubikRegular, size: CGFloat = UIConstants.intermediateSize) -> some View {
        modifier(CustomFont(font: font, size: size))
    }
}
