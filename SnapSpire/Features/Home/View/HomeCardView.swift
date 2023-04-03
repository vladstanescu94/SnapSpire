import SwiftUI

struct HomeCardView: View {
    private enum Layout {
        static let profileImageWidth = 30.0
        static let cardCornerRadius = 10.0
    }

    let user: User

    var body: some View {
        VStack {
            userProfileInfo

            Image(user.userPostImage)

            userPostInfo
        }
        .padding(.vertical, UIConstants.mediumPadding)
        .background {
            RoundedRectangle(cornerRadius: Layout.cardCornerRadius)
                .fill(.white)
        }
        .padding(.horizontal, UIConstants.largePadding)
    }

    var userProfileInfo: some View {
        HStack {
            Image(user.userProfileImage)
                .resizable()
                .scaledToFit()
                .frame(width: Layout.profileImageWidth)
                .foregroundColor(.red)
                .clipShape(Circle())

            Text(user.userName)
                .customFont(font: .rubikItalic, size: UIConstants.mediumSize)
                .foregroundColor(.primaryText)
                .shadow(radius: 4, y: 4)

            Spacer()

            Text(user.timePosting)
                .customFont(font: .rubikItalic)
                .foregroundColor(.placeholder)
        }
        .padding(.horizontal, UIConstants.smallPadding)
    }

    var userPostInfo: some View {
        HStack {
            Image("add")
            Spacer()

            Text("\(user.numberComments)")
                .customFont(font: .rubikItalic)
                .foregroundColor(.secondaryText)
            Image("Chat")

            Text("\(user.numberLikes)")
                .customFont(font: .rubikItalic)
                .foregroundColor(.secondaryText)
            Image("heart")
        }
        .padding(.horizontal, UIConstants.smallPadding)
    }
}

struct HomeCardView_Previews: PreviewProvider {
    static var user = User.sampleData
    static var previews: some View {
        HomeCardView(user: user[0])
    }
}
