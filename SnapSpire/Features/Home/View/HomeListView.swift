import SwiftUI

struct HomeListView: View {
    let user = User.sampleData

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    ForEach(user, id: \.self) { item in
                        NavigationLink {
                            Text("Details for post")
                        } label: {
                            HomeCardView(user: item)
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
