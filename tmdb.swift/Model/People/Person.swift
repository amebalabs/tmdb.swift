import Foundation

extension TMDB.People {
    public struct Person: Codable {
        internal struct ProfileImages: Codable {
            public let profiles: [TMDB.Common.Image]
        }
        public let id: Int64
        public let birthday: Date?
        public let department: String
        public let deathday: Date?
        public let name: String
        public let altNames: [String]
        public let gender: UInt
        public let biography: String
        public let popularity: Double
        public let birthPlace: String?
        internal let profile: String?
        public let adult: Bool
        public let imdb: String
        public let homepage: String?
        public let externalIDs: TMDB.Common.ExternalIDs?
        internal let _images: ProfileImages
        public var images: [TMDB.Common.Image] {
            return _images.profiles
        }

        enum CodingKeys: String, CodingKey {
            case id
            case birthday
            case department = "known_for_department"
            case deathday
            case name
            case altNames = "also_known_as"
            case gender
            case biography
            case popularity
            case birthPlace = "place_of_birth"
            case profile = "profile_path"
            case adult
            case imdb = "imdb_id"
            case homepage
            case externalIDs = "external_ids"
            case _images = "images"
        }
    }
}

extension TMDB.People.Person {
    public func profileURL(size: TMDBImageSizeProtocol = TMDB.Utility.ImageSize.Profile.w185) -> URL? {
        return TMDB.Utility.getImageURL(profile, size: size)
    }
}
