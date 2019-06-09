import Foundation

extension TMDB.Common {
    public struct ProductionCompany: Codable {
        public let id: UInt
        public let name: String
        public let logo: String?
        public let country: String

        enum CodingKeys: String, CodingKey {
            case id
            case name
            case logo = "logo_path"
            case country = "origin_country"
        }
    }
}
