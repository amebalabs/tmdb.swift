import Foundation

extension TMDB.TV {
    public struct TVSeason: Codable {
        public let id: Int64
        public let name: String
        internal let poster: String?
        public let airDate: Date?
        public let episodeCount: UInt?
        public let overview: String
        public let number: UInt
        public let episodes: [TVEpisode]?

        enum CodingKeys: String, CodingKey {
            case id
            case name
            case poster = "poster_path"
            case airDate = "air_date"
            case episodeCount = "episode_count"
            case overview
            case number = "season_number"
            case episodes
        }
    }
}

extension TMDB.TV.TVSeason {
    public func posterURL(size: TMDBImageSizeProtocol = TMDB.Utility.ImageSize.Poster.w154) -> URL? {
        return TMDB.Utility.getImageURL(poster, size: size)
    }
}
