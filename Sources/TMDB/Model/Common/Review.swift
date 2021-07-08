import Foundation

extension TMDB.Common {
    public struct Review: Codable {
        public let id: String
        public let author: String
        public let content: String
        public let url: String
    }
}
