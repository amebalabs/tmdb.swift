import Foundation

extension TMDB.Common {
    public struct ExternalIDs: Codable {
        public let imdb: String?
        public let facebook: String?
        public let instagram: String?
        public let twitter: String?

        enum CodingKeys: String, CodingKey {
            case imdb = "imdb_id"
            case facebook = "facebook_id"
            case instagram = "instagram_id"
            case twitter = "twitter_id"
        }
    }
}
