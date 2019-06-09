import Foundation

extension TMDB.TV {
    public struct TVShow: Codable {
        public let id: Int64
        internal let poster: String?
        public let episodeRuntime: [Int]?
        public let firstAir: Date?
        public let lastAir: Date?
        public let lastEpisode: TVEpisode?
        public let nextEpisode: TVEpisode?
        public let numberOfEpisodes: UInt?
        public let numberOfSeasons: UInt?
        public let inProduction: Bool?
        public let languages: [String]?
        public let overview: String
        public let genres: [TMDB.Common.Genre]?
        public let homepage: String?
        public let originalTitle: String
        public let originalLanguage: String
        public let title: String
        internal let backdrop: String?
        public let popularity: Double?
        public let productionCompanies: [TMDB.Common.ProductionCompany]?
        public let votes: UInt
        public let averageVote: Double
        public let status: String?
        internal let _titles: Results<[TMDB.Common.Title]>?
        public var titles: [TMDB.Common.Title]? {
            return _titles?.results
        }

        internal let _videos: Results<[TMDB.Common.Video]>?
        public var videos: [TMDB.Common.Video]? {
            return _videos?.results
        }
        public let images: TMDB.Common.Images?
        internal let _keywords: Results<[TMDB.Common.Keyword]>?
        public var keywords: [TMDB.Common.Keyword]? {
            return _keywords?.results
        }

        public let credits: TMDB.Common.Credits?

        internal let _contentRating: Results<[TMDB.Common.ContentRating]>?
        public var contentRating: [TMDB.Common.ContentRating]? {
            return _contentRating?.results
        }
        public let externalIDs: TMDB.Common.ExternalIDs?
        internal let _translations: TMDB.Common.Translations?
        public var translations: [TMDB.Common.Translation] {
            return _translations?.translations ?? []
        }
        public let originCountry: [String]?
        public let type: String?
        public let networks: [TVNetwork]?
        public let seasons: [TVSeason]?

        internal let _recommendations: Results<[TVShow]>?
        public var recommendations: [TVShow] {
            return _recommendations?.results ??  []
        }
        internal let _similar: Results<[TVShow]>?
        public var similar: [TVShow] {
            return _similar?.results ?? []
        }
        internal let _reviews: Results<[TMDB.Common.Review]>?
        public var reviews: [TMDB.Common.Review] {
            return _reviews?.results ?? []
        }

        enum CodingKeys: String, CodingKey {
            case id
            case poster = "poster_path"
            case episodeRuntime = "episode_run_time"
            case firstAir = "first_air_date"
            case lastAir  = "last_air_date"
            case lastEpisode = "last_episode_to_air"
            case nextEpisode = "next_episode_to_air"
            case inProduction = "in_production"
            case numberOfEpisodes = "number_of_episodes"
            case numberOfSeasons = "number_of_seasons"
            case languages
            case overview
            case genres
            case homepage
            case originalTitle = "original_name"
            case originalLanguage = "original_language"
            case title = "name"
            case backdrop = "backdrop_path"
            case popularity
            case productionCompanies = "production_companies"
            case votes = "vote_count"
            case averageVote = "vote_average"
            case status
            case credits
            case _titles = "alternative_titles"
            case _videos = "videos"
            case images
            case _keywords = "keywords"
            case externalIDs  = "external_ids"
            case originCountry = "origin_country"
            case type
            case networks
            case seasons
            case _contentRating = "content_ratings"
            case _recommendations = "recommendations"
            case _similar = "similar"
            case _reviews  = "reviews"
            case _translations = "translations"
        }
    }
}

extension TMDB.TV.TVShow {
    public func posterURL(size: TMDBImageSizeProtocol = TMDB.Utility.ImageSize.Poster.w154) -> URL? {
        return TMDB.Utility.getImageURL(poster, size: size)
    }
    public func backdropURL(size: TMDBImageSizeProtocol = TMDB.Utility.ImageSize.Backdrop.w300) -> URL? {
        return TMDB.Utility.getImageURL(poster, size: size)
    }
}
