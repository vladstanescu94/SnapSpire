import SwiftUI

struct TopicSectionView: View {
    let topics = ["photography", "ilustration", "ui design", "photography"]

    var body: some View {
        NavigationView {
            VStack {
                SectionView(sectionName: "Topic", sectionAction: {})
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(topics, id: \.self) { topic in
                            Button {
                                // action for each topic
                            } label: {
                                TopicView(image: topic, name: topic)
                            }
                        }
                    }
                }
            }
            .padding(.horizontal, 16)
        }
    }
}

struct TopicSectionView_Previews: PreviewProvider {
    static var previews: some View {
        TopicSectionView()
    }
}
