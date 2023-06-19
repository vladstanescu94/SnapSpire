import SwiftUI

struct DiscoverView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: UIConstants.extraLargeSize) {
                    SectionListView(sectionName: "Topic",
                                    sectionAction: {},
                                    imageWidth: 150,
                                    imageHeight: 100,
                                    type: .topic)

                    SectionListView(sectionName: "Collection",
                                    sectionAction: {},
                                    imageWidth: 158,
                                    imageHeight: 158,
                                    type: .collection)

                    SectionListView(sectionName: "Sellection",
                                    sectionAction: {},
                                    imageWidth: 158,
                                    imageHeight: 158,
                                    type: .sellection)
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
