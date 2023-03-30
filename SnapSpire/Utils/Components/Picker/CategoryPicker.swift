import SwiftUI

enum Categories: String, CaseIterable {
    case popular, trending, following
}

struct CategoryPicker: View {
    var selectedCategory: Categories

    var body: some View {
        switch selectedCategory {
        case .popular:
            EmptyView()
        case .trending:
            EmptyView()
        case .following:
            EmptyView()
        }
    }
}
