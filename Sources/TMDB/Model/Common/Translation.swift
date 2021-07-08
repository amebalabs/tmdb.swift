import Foundation

extension TMDB.Common {
    public struct Translation: Codable {
        public struct Info: Codable {
            public let title: String
            public let overview: String
            public let homepage: String?
            enum CodingKeys: String, CodingKey {
                case title = "name"
                case overview
                case homepage
            }
        }
        public let iso6391: String
        public let iso31661: String
        public let title: String
        public let englishName: String
        public let info: Info

        enum CodingKeys: String, CodingKey {
            case iso6391 = "iso_639_1"
            case iso31661 = "iso_3166_1"
            case title = "name"
            case englishName = "english_name"
            case info = "data"
        }
    }

    internal struct Translations: Codable {
        public let translations: [Translation]
    }
}
