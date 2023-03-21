import SwiftUI

struct HomeCardView: View {
    let user: User

    var body: some View {
        VStack {
            HStack {
                Image(user.userProfileImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30)
                    .foregroundColor(.red)
                    .clipShape(Circle())

                Text(user.userName)
                    .customFont(font: .rubikItalic, size: 16)
                    .foregroundColor(Color("primaryText"))
                    .shadow(radius: 4, y: 4)

                Spacer()
                Text(user.timePosting)
                    .customFont(font: .rubikItalic)
                    .foregroundColor(Color("placeholder"))
            }
            .padding(.horizontal, 8)

            Image(user.userPostImage)
            HStack {
                Image("add")
                Spacer()

                Text("\(user.numberComments)")
                    .customFont(font: .rubikItalic)
                    .foregroundColor(Color("secondaryText"))
                Image("chat")

                Text("\(user.numberLikes)")
                    .customFont(font: .rubikItalic)
                    .foregroundColor(Color("secondaryText"))
                Image("heart")
            }
            .padding(.horizontal, 8)
        }
        .padding(.vertical, 16)
        .background {
            RoundedRectangle(cornerRadius: 10)
                .fill(.white)
        }
        .padding(.horizontal, 32)
    }
}

struct HomeCardView_Previews: PreviewProvider {
    static var user = User.sampleData
    static var previews: some View {
        HomeCardView(user: user[0])
    }
}
