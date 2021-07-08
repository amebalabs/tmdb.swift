import Foundation

extension TMDB.Common {
    public struct Image: Codable {
        public let ratio: Double
        public let path: String
        public let height: UInt
        public let width: UInt
        public let iso6391: String?
        public let votes: UInt
        public let averageVote: Double

        enum CodingKeys: String, CodingKey {
            case ratio = "aspect_ratio"
            case path = "file_path"
            case height
            case width
            case iso6391 = "iso_639_1"
            case votes = "vote_count"
            case averageVote = "vote_average"
        }
    }

    public struct Images: Codable {
        public let backdrops: [Image]?
        public let posters: [Image]?
    }
}

public protocol TMDBImageSizeProtocol {}

extension TMDB.Utility {
    public enum ImageSize {
        public enum Backdrop: String, TMDBImageSizeProtocol {
            case w300
            case w780
            case w1280
            case original
        }
        public enum Logo: String, TMDBImageSizeProtocol {
            case w45
            case w92
            case w154
            case w185
            case w300
            case w500
            case original
        }
        public enum Poster: String, TMDBImageSizeProtocol {
            case w92
            case w154
            case w185
            case w342
            case w500
            case w780
            case original
        }
        public enum Profile: String, TMDBImageSizeProtocol {
            case w45
            case w185
            case h632
            case original
        }
        public enum Still: String, TMDBImageSizeProtocol {
            case w92
            case w185
            case w300
            case original
        }
    }
}
