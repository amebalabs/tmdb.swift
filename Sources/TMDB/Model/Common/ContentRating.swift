import Foundation

extension TMDB.Common {
    public struct ContentRating: Codable {
        public let iso31661: String
        public let rating: String

        enum CodingKeys: String, CodingKey {
            case iso31661 = "iso_3166_1"
            case rating
        }
    }
}
