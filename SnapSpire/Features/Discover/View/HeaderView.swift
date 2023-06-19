import SwiftUI

struct HeaderView: View {
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

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(sectionName: "Topic", sectionAction: {})
    }
}
