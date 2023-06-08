import SwiftUI

struct SectionView: View {
    var sectionName: String
    var sectionAction: () -> Void

    var body: some View {
        HStack {
            Text(sectionName)
                .customFont(font: .rubikBold, size: 20)

            Spacer()

            Button {
                sectionAction()
            } label: {
                Text("View More")
                    .customFont(font: .rubikLightItalic, size: 14)
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
