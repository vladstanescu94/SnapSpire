import Foundation

struct User: Hashable, Identifiable {
    var id = UUID()
    var userProfileImage: String
    var userName: String
    var userPostImage: String
    var timePosting: String
    var numberComments: Int = 0
    var numberLikes: Int = 0
    var url: URL = .init(string: "https://trello.com/b/MYbaJqxA/snapspire")!
}

extension User {
    static let sampleData: [User] = [
        User(userProfileImage: "Avatar", userName: "Thanh Pham", userPostImage: "Photo", timePosting: "1 hour ago"),
        User(userProfileImage: "Avatar", userName: "Erica Pham", userPostImage: "Photo", timePosting: "2 hour ago"),
        User(userProfileImage: "Avatar", userName: "Anna Pham", userPostImage: "Photo", timePosting: "3 hour ago"),
    ]
}
