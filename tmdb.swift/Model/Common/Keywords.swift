import Foundation

extension TMDB.Common {
    public struct Keyword: Codable {
        public let id: Int64
        public let name: String
    }
    internal struct Keywords: Codable {
        public let keywords: [Keyword]
    }
}
