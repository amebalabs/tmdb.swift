import Foundation

private enum RequestExtenders: String, CaseIterable {
    case alternative_titles
    case content_ratings
    case credits
    case external_ids
    case images
    case keywords
    case recommendations
    case reviews
    case similar
    case translations
    case videos
}

extension TMDB.TV {
    internal struct TVGetDetails: APIRequest {
        typealias Response = TVShow

        var resourceName: String

        var method: String {
            return HTTPMethod.GET
        }
        var parameters: [String: String]? {
            return ["append_to_response": RequestExtenders.allCases.map({$0.rawValue}).joined(separator: ",")]
        }
        init(_ id: Int64) {
            self.resourceName = APIEndpoint.TV.details.replacingOccurrences(of: "{tv_id}", with: String(id))
        }
    }
}
