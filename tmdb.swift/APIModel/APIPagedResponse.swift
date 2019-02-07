import Foundation

extension TMDB.Utility {
    public struct APIPagedResponse<Response: Decodable>: Decodable {
        public struct Dates: Codable {
            public let minimum: Date
            public let maximum: Date
        }
        public let dates: Dates?
        public let id: Int64?
        public let page: Int
        public let totalPages: Int
        public let totalResults: Int
        public let results: Response

        enum CodingKeys: String, CodingKey {
            case id
            case dates
            case page
            case totalPages = "total_pages"
            case totalResults = "total_results"
            case results
        }
    }
}
