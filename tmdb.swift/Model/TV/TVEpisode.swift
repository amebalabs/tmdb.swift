import Foundation

extension TMDB.TV {
    public struct TVEpisode: Codable {
        internal struct StillImages: Codable {
            public let stills: [TMDB.Common.Image]
        }
        public let id: Int64
        public let airDate: Date
        public let crew: [TMDB.Common.Credits.CrewMember]?
        public let number: UInt
        public let guestStars: [TMDB.Common.Credits.CastMember]?
        public let name: String
        public let overview: String
        public let productionCode: String?
        public let seasonNumber: UInt
        internal let stillPath: String?
        public let averageVote: Double
        public let votes: UInt
        public let credits: TMDB.Common.Credits?
        public let externalIDs: TMDB.Common.ExternalIDs?
        internal let _images: StillImages?
        public var images: [TMDB.Common.Image] {
            return _images?.stills ?? []
        }
        internal let _translations: TMDB.Common.Translations?
        public var translations: [TMDB.Common.Translation] {
            return _translations?.translations ?? []
        }
        internal let _videos: Results<[TMDB.Common.Video]>?
        public var videos: [TMDB.Common.Video] {
            return _videos?.results ?? []
        }

        enum CodingKeys: String, CodingKey {
            case id
            case airDate = "air_date"
            case crew
            case number = "episode_number"
            case guestStars = "guest_stars"
            case name
            case overview
            case productionCode = "production_code"
            case seasonNumber = "season_number"
            case stillPath = "still_path"
            case averageVote = "vote_average"
            case votes = "vote_count"
            case credits
            case externalIDs = "external_ids"
            case _images = "images"
            case _translations = "translations"
            case _videos = "videos"
        }
    }
}

extension TMDB.TV.TVEpisode {
    public func stillURL(size: TMDBImageSizeProtocol = TMDB.Utility.ImageSize.Still.w185) -> URL? {
        return TMDB.Utility.getImageURL(stillPath, size: size)
    }
}
