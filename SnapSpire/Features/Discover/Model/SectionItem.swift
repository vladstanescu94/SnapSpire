import Foundation

struct SectionItem: Identifiable, Hashable {
    var id = UUID()
    var name: String
    var image: String
    var items: [SectionImages]
    var type: ImageType
}

struct SectionImages: Hashable, Identifiable {
    var nameImage: String
    var id = UUID()
}

extension SectionItem {
    static let topics: [SectionItem] = [
        SectionItem(name: "photo", image: "photo", items: [SectionImages(nameImage: "photo")], type: .topic),
        SectionItem(name: "img", image: "design", items: [SectionImages(nameImage: "photo")], type: .collection),
        SectionItem(name: "img", image: "ilustration", items: [SectionImages(nameImage: "photo")], type: .collection),
        SectionItem(name: "sel", image: "collection", items: [SectionImages(nameImage: "design")], type: .sellection),
    ]
}

enum ImageType: Comparable {
    case collection
    case topic
    case sellection
}
