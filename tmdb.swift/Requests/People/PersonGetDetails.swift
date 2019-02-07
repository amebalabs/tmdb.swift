import Foundation

private enum RequestExtenders: String, CaseIterable {
    case movie_credits
    case tv_credits
    case external_ids
    case images
}

extension TMDB.People {
    internal struct PersonGetDetails: APIRequest {
        typealias Response = Person

        var resourceName: String

        var method: String {
            return HTTPMethod.GET
        }
        var parameters: [String: String]? {
            return ["append_to_response": RequestExtenders.allCases.map({$0.rawValue}).joined(separator: ",")]
        }
        init(_ id: Int64) {
            self.resourceName = APIEndpoint.People.details.replacingOccurrences(of: "{person_id}", with: String(id))
        }
    }
}
