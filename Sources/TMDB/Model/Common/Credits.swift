import Foundation

extension TMDB.Common {
    public struct Credits: Codable {
        public struct CastMember: Codable {
            public let id: Int64
            public let character: String
            public let creditId: String
            public let gender: Int?
            public let name: String
            public let order: Int
            public let profile: String?

            enum CodingKeys: String, CodingKey {
                case id
                case character
                case creditId = "credit_id"
                case gender
                case name
                case order
                case profile = "profile_path"
            }
        }
        public struct CrewMember: Codable {
            public let id: Int64
            public let creditId: String
            public let department: String
            public let gender: Int?
            public let job: String
            public let name: String
            public let profile: String?

            enum CodingKeys: String, CodingKey {
                case id
                case creditId = "credit_id"
                case department
                case gender
                case job
                case name
                case profile = "profile_path"
            }
        }

        public let cast: [CastMember]
        public let crew: [CrewMember]
        public let guestStars: [CastMember]?

        enum CodingKeys: String, CodingKey {
            case cast
            case crew
            case guestStars = "guest_stars"
        }
    }
}
