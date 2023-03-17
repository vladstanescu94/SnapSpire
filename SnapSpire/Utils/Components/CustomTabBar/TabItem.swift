import Foundation

enum TabItem: String, CaseIterable {
    case home
    case category
    case addContent
    case notification
    case profile

    var iconSelected: String {
        switch self {
        case .home:
            return "homeFill"
        case .category:
            return "categoryFill"
        case .addContent:
            return "addContent"
        case .notification:
            return "notificationFill"
        case .profile:
            return "profileFill"
        }
    }
}
