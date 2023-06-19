import SwiftUI

struct ContentView: View {
    @State private var tabSelection: TabItem = .home

    var body: some View {
        CustomTabBarContainerView(selected: $tabSelection) {
            HomeView()
                .tabBarItem(tabItem: .home, selected: $tabSelection)
            DiscoverView()
                .tabBarItem(tabItem: .category, selected: $tabSelection)
            Color.green
                .tabBarItem(tabItem: .addContent, selected: $tabSelection)
            Color.white
                .tabBarItem(tabItem: .notification, selected: $tabSelection)
            Color.orange
                .tabBarItem(tabItem: .profile, selected: $tabSelection)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
