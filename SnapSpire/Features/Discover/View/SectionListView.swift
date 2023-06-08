import SwiftUI

protocol SectionListViewMoldeProtocol: ObservableObject {
    var topics: [String] { get }
}

struct SectionListView<Model>: View where Model: SectionListViewMoldeProtocol {
    @StateObject var viewModel: Model

    var sectionName: String
    var sectionAction: () -> Void
    var imageWidth: CGFloat
    var imageHeight: CGFloat

    var body: some View {
        VStack {
            SectionView(sectionName: sectionName, sectionAction: { sectionAction() })

            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(viewModel.topics, id: \.self) { topic in
                        Button {
                            // action for each topic
                        } label: {
                            CardView(image: topic, name: topic, imageWidth: imageWidth, imageHeight: imageHeight)
                        }
                    }
                }
            }
        }
        .padding(.horizontal, 16)
    }
}
