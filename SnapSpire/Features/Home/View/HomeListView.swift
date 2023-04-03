import SwiftUI

struct HomeListView: View {
    @State private var searchText = ""
    @State var selectedCaregory: Categories = .popular

    let user = User.sampleData

    var filteredUsers: [User] {
        if searchText.isEmpty {
            return user
        } else {
            return user.filter { $0.userName.localizedCaseInsensitiveContains(searchText) }
        }
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    PickerView(userCategory: $selectedCaregory)

                    switch selectedCaregory {
                    case .popular:
                        popularView
                    case .trending:
                        someView(text: "Trending")
                    case .following:
                        someView(text: "Following")
                    }
                }
                .padding(.bottom, 60)
            }
        }
    }

    var popularView: some View {
        ForEach(filteredUsers, id: \.self) { user in
            NavigationLink(value: user) {
                HomeCardView(user: user)
            }
        }
        .searchable(text: $searchText)
        .navigationDestination(for: User.self) { user in
            Text(user.userName)
        }
    }

    func someView(text: String) -> some View {
        NavigationStack {
            Text(text)
        }
        .navigationTitle(text)
    }
}

struct HomeListView_Previews: PreviewProvider {
    static var previews: some View {
        HomeListView()
    }
}
