import Foundation

private enum RequestExtenders: String, CaseIterable {
    case alternative_titles
    case credits
    case external_ids
    case images
    case keywords
    case recommendations
    case release_dates
    case reviews
    case similar
    case videos
}

extension TMDB.Movies {
    internal struct GetDetails: APIRequest {
        typealias Response = Movie

        var resourceName: String

        var method: String {
            return HTTPMethod.GET
        }

        var parameters: [String: String]? {
            return ["append_to_response": RequestExtenders.allCases.map({$0.rawValue}).joined(separator: ",")]
        }
        init(_ id: Int64) {
            self.resourceName = APIEndpoint.Movie.details.replacingOccurrences(of: "{movie_id}", with: String(id))
        }
    }
}
