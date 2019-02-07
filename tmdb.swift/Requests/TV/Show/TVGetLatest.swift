import Foundation

extension TMDB.TV {
    internal struct TVGetLatest: APIRequest {
        typealias Response = TVShow

        var resourceName: String {
            return APIEndpoint.TV.latest
        }
        var method: String {
            return HTTPMethod.GET
        }
    }
}
