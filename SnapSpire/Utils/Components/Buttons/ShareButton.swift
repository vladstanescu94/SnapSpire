import SwiftUI

struct ShareButton: View {
    private let url = URL(string: "https://trello.com/b/MYbaJqxA/snapspire")

    var body: some View {
        VStack {
            ShareLink(item: url!) {
                Image("send")
                    .padding(UIConstants.smallPadding)
                    .background(.thinMaterial)
                    .cornerRadius(24)
            }
        }
    }
}

struct ShareButton_Previews: PreviewProvider {
    static var previews: some View {
        ShareButton()
    }
}
