import SwiftUI

struct SectionListView: View {
    var title: String
    var action: () -> Void
    var imgWidth: CGFloat
    var imgHeight: CGFloat
    var type: ImageType?

    var items: [SectionItem] {
        SectionItem.topics.filter { $0.type == type }
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
                        NavigationLink(value: item) {
                            CardView(image: item.image, name: item.name, imageWidth: imgWidth, imageHeight: imgHeight)
                        }
                    }
                }
            }
            .navigationDestination(for: SectionItem.self) { item in
                ScrollView {
                    LazyVGrid(columns: columns) {
                        ForEach(item.items) { card in
                            CardView(image: card.nameImage, name: card.nameImage, type: item.type)
                        }
                    }
                    .padding()
                }
            }
        }
        .padding(.horizontal, UIConstants.mediumPadding)
    }
}
