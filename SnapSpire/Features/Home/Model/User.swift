import Foundation

struct User: Hashable, Identifiable {
    var id = UUID()
    var userProfileImage: String
    var userName: String
    var userPostImage: String
    var timePosting: String
    var numberComments: Int = 0
    var numberLikes: Int = 0
}

extension User {
    static let sampleData: [User] = [
        User(userProfileImage: "Avatar", userName: "Thanh Pham", userPostImage: "Photo", timePosting: "1 hour ago"),
        User(userProfileImage: "Avatar", userName: "Thanh Pham", userPostImage: "Photo", timePosting: "1 hour ago"),
        User(userProfileImage: "Avatar", userName: "Thanh Pham", userPostImage: "Photo", timePosting: "1 hour ago"),
    ]
}
