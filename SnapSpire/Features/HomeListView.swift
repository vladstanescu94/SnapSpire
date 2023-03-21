import SwiftUI

struct HomeListView: View {
    var body: some View {
        List {
            ForEach(1 ... 100, id: \.self) { nr in
                Text("\(nr)")
            }
        }
    }
}

struct HomeListView_Previews: PreviewProvider {
    static var previews: some View {
        HomeListView()
    }
}
