import Foundation

extension TMDB.Movies {
    public struct List: Codable {
        public let id: Int64
        public let description: String?
        public let favoriteCount: UInt
        public let itemCount: UInt
        public let iso6391: String
        public let listType: String
        public let name: String
        public let poster: String?

        enum CodingKeys: String, CodingKey {
            case id
            case description
            case favoriteCount = "favorite_count"
            case itemCount = "item_count"
            case iso6391 = "iso_639_1"
            case listType = "list_type"
            case name
            case poster = "poster_path"
        }
    }
}
