import SwiftUI

struct CustomTabBarContainerView<Content: View>: View {
    @Binding var selected: TabItem
    let content: Content

    init(selected: Binding<TabItem>, @ViewBuilder content: () -> Content) {
        _selected = selected
        self.content = content()
    }

    var body: some View {
        ZStack(alignment: .bottom) {
            content
                .ignoresSafeArea()

            CustomTabBarView(selectedTab: $selected)
        }
    }
}
