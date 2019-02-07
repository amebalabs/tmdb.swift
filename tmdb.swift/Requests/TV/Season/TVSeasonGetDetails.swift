import Foundation

private enum RequestExtenders: String, CaseIterable {
    case images
    case videos
    case credits
    case external_ids
}

extension TMDB.TV {
    internal struct TVSeasonGetDetails: APIRequest {
        typealias Response = TVSeason

        var resourceName: String

        var method: String {
            return HTTPMethod.GET
        }

        var parameters: [String: String]? {
            return ["append_to_response": RequestExtenders.allCases.map({$0.rawValue}).joined(separator: ",")]
        }
        init(_ id: Int64, season: UInt, page: Int = 1) {
            self.resourceName = APIEndpoint.TV.Season.details.replacingOccurrences(of: "{tv_id}", with: String(id)).replacingOccurrences(of: "{season}", with: String(season))
        }
    }
}
