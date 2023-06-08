import SwiftUI

struct DiscoverView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 0) {
                    SectionListView(viewModel: TopicsViewModel(),
                                    sectionName: "Topic",
                                    sectionAction: {},
                                    imageWidth: 150,
                                    imageHeight: 100)

                    SectionListView(viewModel: CollectionViewModel(),
                                    sectionName: "Section",
                                    sectionAction: {},
                                    imageWidth: 158,
                                    imageHeight: 158)
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
