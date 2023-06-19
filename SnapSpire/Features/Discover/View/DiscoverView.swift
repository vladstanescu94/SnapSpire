import SwiftUI

struct DiscoverView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: UIConstants.extraLargeSize) {
                    SectionListView(title: "Topic", action: {}, imgWidth: 150, imgHeight: 100, type: .topic)

                    SectionListView(title: "Collection", action: {}, imgWidth: 158, imgHeight: 158, type: .collection)

                    SectionListView(title: "Sellection", action: {}, imgWidth: 158, imgHeight: 158, type: .sellection)
                }
            }
        }
    }
}

struct DiscoverView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverView()
    }
}
