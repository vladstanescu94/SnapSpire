import SwiftUI

struct HomeListView: View {
    let user = User.sampleData

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    ForEach(user, id: \.self) { item in
                        NavigationLink {
                            Text("Details for \(item.name)'s post")
                        } label: {
                            SampleCardView(name: item.name, profileColor: item.profileColor, postColor: item.postColor)
                                .padding()
                        }
                    }
                }
            }
        }
    }
}

struct HomeListView_Previews: PreviewProvider {
    static var previews: some View {
        HomeListView()
    }
}
