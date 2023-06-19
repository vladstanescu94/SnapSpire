import Foundation

struct Section: Hashable {
    var name: String
    var image: String
    var items: [ImageSection]
    var type: ImageType
}

struct ImageSection: Hashable, Identifiable {
    var nameImage: String
    var id = UUID()
}

extension Section {
    static let topics: [Section] = [
        Section(name: "photo", image: "photography", items: [ImageSection(nameImage: "photography")], type: .topic),
        Section(name: "img", image: "photography", items: [ImageSection(nameImage: "photography")], type: .collection),
        Section(name: "sel", image: "ilustration", items: [ImageSection(nameImage: "ui design")], type: .sellection),
    ]
}

enum ImageType: Comparable {
    case collection
    case topic
    case sellection
}
