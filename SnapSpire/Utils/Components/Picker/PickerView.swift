import SwiftUI

struct PickerView: View {
    @State private var userCategory: Categories = .popular

    var body: some View {
        NavigationStack {
            VStack {
                Picker("Categories", selection: $userCategory) {
                    ForEach(Categories.allCases, id: \.self) { category in
                        Text(category.rawValue.capitalized)
                    }
                }
                .onAppear {
                    UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(.white)
                    UISegmentedControl.appearance().backgroundColor = UIColor(.primary)
                    UISegmentedControl.appearance().selectedConfig()
                    UISegmentedControl.appearance().defaultConfig()
                }
                .frame(height: 40)
                .padding(.horizontal)
                .background(.white)
                .pickerStyle(.segmented)

                CategoryPicker(selectedCategory: userCategory)
            }
        }
    }
}

struct PickerView_Previews: PreviewProvider {
    static var previews: some View {
        PickerView()
    }
}
