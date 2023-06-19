import SwiftUI

struct SectionListView: View {
    var sectionName: String
    var sectionAction: () -> Void
    var imageWidth: CGFloat
    var imageHeight: CGFloat
    var type: ImageType

    var items: [Section] {
        Section.topics.filter { $0.type == type }
    }

    let columns = [GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        VStack {
            if !items.isEmpty {
                HeaderView(sectionName: sectionName, sectionAction: { sectionAction() })
            }

            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(items, id: \.self) { item in
                        NavigationLink {
                            ScrollView {
                                LazyVGrid(columns: columns) {
                                    ForEach(item.items) { card in
                                        CardView(image: card.nameImage,
                                                 name: card.nameImage,
                                                 type: item.type)
                                    }
                                }.padding()
                            }
                        } label: {
                            CardView(image: item.image,
                                     name: item.name,
                                     imageWidth: imageWidth,
                                     imageHeight: imageHeight)
                        }
                    }
                }
            }
        }
        .padding(.horizontal, UIConstants.mediumPadding)
    }
}
