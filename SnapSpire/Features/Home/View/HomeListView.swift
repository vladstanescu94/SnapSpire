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

                    if selectedCaregory == .popular {
                        ForEach(filteredUsers, id: \.self) { user in
                            NavigationLink(value: user) {
                                HomeCardView(user: user)
                            }
                        }
                        .navigationDestination(for: User.self) { user in
                            Text(user.userName)
                        }
                    } else if selectedCaregory == .following {
                        CategoryPicker(selectedCategory: .following)

                    } else {
                        CategoryPicker(selectedCategory: .trending)
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
