import SwiftUI

struct TopicSectionView: View {
    let topics = ["photography", "ilustration", "ui design", "photography"]

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("Topic")
                        .customFont(font: .rubikBold, size: 20)

                    Spacer()

                    Button {
                        // view more topics
                    } label: {
                        Text("View More")
                            .customFont(font: .rubikLightItalic, size: 14)
                            .foregroundColor(.primary)
                    }
                }

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
