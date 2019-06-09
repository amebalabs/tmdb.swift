import Foundation

extension TMDB.Common {
    public struct Video: Codable {
        public enum Category: String, Codable {
            case trailer = "Trailer"
            case teaser = "Teaser"
            case clip = "Clip"
            case featurette = "Featurette"
            case openingCredits = "Opening Credits"
        }
        public let id: String
        public let iso6391: String
        public let iso31661: String
        public let key: String
        public let name: String
        public let site: String
        public let size: Int
        public let type: Category

        enum CodingKeys: String, CodingKey {
            case id
            case iso6391 = "iso_639_1"
            case iso31661 = "iso_3166_1"
            case key
            case name
            case site
            case size
            case type
        }
    }
}
