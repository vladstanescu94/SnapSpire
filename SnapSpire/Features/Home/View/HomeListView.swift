import SwiftUI

struct HomeListView: View {
    let user = User.sampleData

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    ForEach(user, id: \.self) { user in
                        NavigationLink(value: user) {
                            HomeCardView(user: user)
                        }
                    }.navigationDestination(for: User.self) { user in
                        Text(user.userName)
                    }
                }
                .padding(.bottom, 60)
            }
        }
    }
}

struct HomeListView_Previews: PreviewProvider {
    static var previews: some View {
        HomeListView()
    }
}
