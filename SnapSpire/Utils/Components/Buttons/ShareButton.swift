import SwiftUI

struct ShareButton: View {
    var url: URL

    var body: some View {
        VStack {
            ShareLink(item: url) {
                Image("send")
                    .padding(UIConstants.smallPadding)
                    .background(.thinMaterial)
                    .cornerRadius(24)
            }
        }
    }
}
