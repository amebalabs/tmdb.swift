import Foundation

extension TMDB.Common {
    public struct Title: Codable {
        public let iso31661: String
        public let title: String
        public let type: String

        enum CodingKeys: String, CodingKey {
            case iso31661 = "iso_3166_1"
            case title
            case type
        }
    }
}
