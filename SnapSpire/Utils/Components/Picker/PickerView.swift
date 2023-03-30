import SwiftUI

struct PickerView: View {
    @State private var category: Categories = .popular

    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(.white)
        UISegmentedControl.appearance().backgroundColor = UIColor(.primary)
        UISegmentedControl.appearance().selectedConfig()
        UISegmentedControl.appearance().defaultConfig()
    }

    var body: some View {
        VStack {
            Picker("Categories", selection: $category) {
                ForEach(Categories.allCases, id: \.self) { category in
                    Text(category.rawValue.capitalized)
                }
            }
            .frame(height: 40)
            .padding(.horizontal)
            .background(.white)
            .pickerStyle(.segmented)

            CategoryPicker(selectedCategory: category)
        }
    }
}

struct PickerView_Previews: PreviewProvider {
    static var previews: some View {
        PickerView()
    }
}
