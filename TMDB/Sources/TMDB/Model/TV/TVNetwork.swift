import Foundation

extension TMDB.TV {
    public struct TVNetwork: Codable {
        public struct Logo: Codable {
            public let ratio: Double
            public let path: String

            enum CodingKeys: String, CodingKey {
                case ratio = "aspect_ratio"
                case path
            }
        }

        public let id: Int64
        public let name: String
        public let logoAlt: String?
        public let logo: Logo?
        public let country: String

         enum CodingKeys: String, CodingKey {
            case id
            case name
            case logoAlt = "logo_path"
            case logo
            case country = "origin_country"
        }
    }
}
