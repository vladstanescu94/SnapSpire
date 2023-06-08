import SwiftUI

struct SectionView: View {
    var sectionName: String
    var sectionAction: () -> Void

    var body: some View {
        HStack {
            Text(sectionName)
                .customFont(font: .rubikBold, size: UIConstants.largeSize)

            Spacer()

            Button {
                sectionAction()
            } label: {
                Text("View More")
                    .customFont(font: .rubikLightItalic, size: UIConstants.intermediateSize)
                    .foregroundColor(.primary)
            }
        }
    }
}

struct SectionView_Previews: PreviewProvider {
    static var previews: some View {
        SectionView(sectionName: "Topic", sectionAction: {})
    }
}
