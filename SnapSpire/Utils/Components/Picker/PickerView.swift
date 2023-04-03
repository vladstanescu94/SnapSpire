import SwiftUI

enum Categories: String, CaseIterable {
    case popular
    case trending
    case following
}

struct PickerView: View {
    @Binding var userCategory: Categories

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
            }
        }
    }
}
