import SwiftUI

struct SectionListView: View {
    var title: String
    var action: () -> Void
    var imgWidth: CGFloat
    var imgHeight: CGFloat
    var type: ImageType?

    var items: [Section] {
        Section.topics.filter { $0.type == type }
    }

    let columns = [GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        VStack {
            if !items.isEmpty {
                HeaderView(sectionName: title, sectionAction: { action() })
            }

            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(items, id: \.self) { item in
                        NavigationLink {
                            ScrollView {
                                LazyVGrid(columns: columns) {
                                    ForEach(item.items) { card in
                                        CardView(image: card.nameImage, name: card.nameImage, type: item.type)
                                    }
                                }.padding()
                            }
                        } label: {
                            CardView(image: item.image, name: item.name, imageWidth: imgWidth, imageHeight: imgHeight)
                        }
                    }
                }
            }
        }
        .padding(.horizontal, UIConstants.mediumPadding)
    }
}
