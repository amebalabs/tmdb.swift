import Foundation

extension TMDB.Movies {
    public struct Movie: Codable {
        public struct ReleaseDate: Codable {
            public let certification: String?
            public let iso6391: String?
            public let date: String?
            public let type: Int
            public let note: String

            enum CodingKeys: String, CodingKey {
                case certification
                case iso6391 = "iso_649_1"
                case date = "release_date"
                case type
                case note
            }
        }

        public struct ReleaseDates: Codable {
            public let iso31661: String
            public let releaseDates: [ReleaseDate]

            enum CodingKeys: String, CodingKey {
                case iso31661 = "iso_3166_1"
                case releaseDates = "release_dates"
            }
        }
        public struct ProductionCountry: Codable {
            public let iso31661: String
            public let name: String

            enum CodingKeys: String, CodingKey {
                case iso31661 = "iso_3166_1"
                case name
            }
        }

        public enum Status: String, Codable {
            case rumored = "Rumored"
            case planned = "Planned"
            case inProduction = "In Production"
            case postProduction = "Post Production"
            case released = "Released"
            case canceled = "Canceled"
        }

        public let id: Int64
        internal let poster: String?
        public let adult: Bool
        public let budget: UInt?
        public let overview: String
        public let release: Date
        public let genres: [TMDB.Common.Genre]?
        public let homepage: String?
        public let originalTitle: String
        public let originalLanguage: String
        public let spokenLanguages: [TMDB.Common.Language]?
        public let title: String
        internal let backdrop: String?
        public let popularity: Double
        public let productionCompanies: [TMDB.Common.ProductionCompany]?
        public let productionCountries: [ProductionCountry]?
        public let votes: UInt
        public let revenue: UInt?
        public let runtime: UInt?
        public let video: Bool
        public let averageVote: Double
        public let status: Status?
        public let tagline: String?
        public let titles: [TMDB.Common.Title]?
        public let images: TMDB.Common.Images?
        internal let _keywords: TMDB.Common.Keywords?
        public var keywords: [TMDB.Common.Keyword] {
            return _keywords?.keywords ?? []
        }
        public let credits: TMDB.Common.Credits?
        internal let _releaseDates: Results<[ReleaseDates]>?
        public var releaseDates: [ReleaseDates]? {
            return _releaseDates?.results
        }
        public let externalIDs: TMDB.Common.ExternalIDs?
        internal let _recommendations: Results<[Movie]>?
        public var recommendations: [Movie]? {
            return _recommendations?.results
        }
        internal let _similar: Results<[Movie]>?
        public var similar: [Movie]? {
            return _similar?.results
        }
        internal let _reviews: Results<[TMDB.Common.Review]>?
        public var reviews: [TMDB.Common.Review]? {
            return _reviews?.results
        }

        enum CodingKeys: String, CodingKey {
            case id
            case poster = "poster_path"
            case adult
            case budget
            case overview
            case spokenLanguages = "spoken_languages"
            case release = "release_date"
            case genres = "genre_id"
            case homepage
            case originalTitle = "original_title"
            case originalLanguage = "original_language"
            case title
            case backdrop = "backdrop_path"
            case popularity
            case productionCompanies = "production_companies"
            case productionCountries = "production_countries"
            case votes = "vote_count"
            case revenue
            case runtime
            case video
            case averageVote = "vote_average"
            case status
            case tagline
            case titles
            case images
            case _keywords = "keywords"
            case credits
            case _releaseDates
            case externalIDs  = "external_ids"
            case _recommendations  = "recommendations"
            case _similar = "similar"
            case _reviews  = "reviews"
        }
    }
}

extension TMDB.Movies.Movie {
    public func posterURL(size: TMDBImageSizeProtocol = TMDB.Utility.ImageSize.Poster.w154) -> URL? {
        return TMDB.Utility.getImageURL(poster, size: size)
    }
    public func backdropURL(size: TMDBImageSizeProtocol = TMDB.Utility.ImageSize.Backdrop.w300) -> URL? {
        return TMDB.Utility.getImageURL(poster, size: size)
    }
}
