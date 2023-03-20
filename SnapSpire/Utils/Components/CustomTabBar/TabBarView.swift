import SwiftUI

struct TabBarView: View {
    @State var selectedTab: TabItem = .home

    init() {
        UITabBar.appearance().isHidden = true
    }

    var body: some View {
        VStack {
            TabView(selection: $selectedTab) {
                ForEach(TabItem.allCases, id: \.self) { tab in
                    HStack {
                        Image(tab.rawValue)
                            .colorMultiply(.mint)
                        Text(tab.rawValue.capitalized)
                            .animation(.easeIn, value: selectedTab)
                    }
                }
            }
            Spacer()
            CustomTabBarView(selectedTab: $selectedTab)
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
