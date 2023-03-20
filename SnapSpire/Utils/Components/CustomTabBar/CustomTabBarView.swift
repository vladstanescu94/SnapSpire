import SwiftUI

struct CustomTabBarView: View {
    @Binding var selectedTab: TabItem

    var body: some View {
        VStack {
            HStack {
                ForEach(TabItem.allCases, id: \.self) { tab in
                    HStack {
                        withAnimation(.easeIn) {
                            HStack {
                                Image(selectedTab == tab ? tab.iconSelected : tab.rawValue)
                                    .scaleEffect(selectedTab == tab ? 1.25 : 1)
                                    .onTapGesture {
                                        selectedTab = tab
                                    }
                            }
                            .padding(.horizontal)
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity)
            .background(.thinMaterial)
        }
    }
}

struct CustomTabBarView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBarView(selectedTab: .constant(.home))
    }
}
