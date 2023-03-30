import SwiftUI

struct HomeListView: View {
    @State private var searchText = ""

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
                    PickerView()

                    ForEach(filteredUsers, id: \.self) { user in
                        NavigationLink(value: user) {
                            HomeCardView(user: user)
                        }
                    }
                    .navigationDestination(for: User.self) { user in
                        Text(user.userName)
                    }
                }
                .padding(.bottom, 60)
            }
        }
        .searchable(text: $searchText)
    }
}

struct HomeListView_Previews: PreviewProvider {
    static var previews: some View {
        HomeListView()
    }
}
