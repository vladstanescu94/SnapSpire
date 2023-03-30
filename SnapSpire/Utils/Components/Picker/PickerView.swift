import SwiftUI

struct PickerView: View {
    @State private var category: Categories = .popular

    var body: some View {
        VStack {
            Picker("Categories", selection: $category) {
                ForEach(Categories.allCases, id: \.self) { category in
                    Text(category.rawValue.capitalized)
                }
            }
            .padding(.horizontal)
            .background(.white)
            .pickerStyle(.segmented)
        }
    }
}

struct PickerView_Previews: PreviewProvider {
    static var previews: some View {
        PickerView()
    }
}
