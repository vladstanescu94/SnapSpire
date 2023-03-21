import SwiftUI
// swiftformat disable

struct HomeListView: View {
    let columns = [GridItem(.flexible())]
    let user = User.sampleData

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(user, id: \.self) { item in
                        NavigationLink {
                            Text("Details for \(item.name)'s post")
                        } label: {
                            SampleCardView(name: item.name, colorProfile: item.colorProfile, colorPost: item.colorPost)
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

struct SampleCardView: View {
    let name: String
    var colorProfile: Color
    var colorPost: Color

    var body: some View {
        VStack {
            HStack {
                Circle()
                    .foregroundColor(colorProfile)
                    .frame(width: 30)
                    .clipShape(Circle())

                Text(name)
                    .font(.headline)
                Spacer()
            }

            Rectangle()
                .fill(colorPost)
                .aspectRatio(contentMode: .fit)
                .cornerRadius(10)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 10)
    }
}

struct User: Hashable {
    var name: String
    var colorProfile: Color
    var colorPost: Color
}

extension User {
    static let sampleData: [User] = [
        User(name: "Ana", colorProfile: .mint, colorPost: .green),
        User(name: "Jhon", colorProfile: .green, colorPost: .red),
        User(name: "Ionel", colorProfile: .mint, colorPost: .accentColor),
        User(name: "Paula", colorProfile: .pink, colorPost: .black),
        User(name: "Marius", colorProfile: .black, colorPost: .cyan),
        User(name: "Andrei", colorProfile: .blue, colorPost: .yellow),
        User(name: "Maria", colorProfile: .gray, colorPost: .orange),
    ]
}
