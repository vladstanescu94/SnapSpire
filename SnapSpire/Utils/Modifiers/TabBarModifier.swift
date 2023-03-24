import SwiftUI

struct TabBarModifier: ViewModifier {
    let tabItem: TabItem
    @Binding var selected: TabItem

    func body(content: Content) -> some View {
        content
            .opacity(selected == tabItem ? 1.0 : 0.0)
    }
}

extension View {
    func tabBarItem(tabItem: TabItem, selected: Binding<TabItem>) -> some View {
        modifier(TabBarModifier(tabItem: tabItem, selected: selected))
    }
}
