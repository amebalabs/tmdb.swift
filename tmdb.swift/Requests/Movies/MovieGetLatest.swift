import Foundation

extension TMDB.Movies {
    internal struct MovieGetLatest: APIRequest {
        typealias Response = Movie

        var resourceName: String {
            return APIEndpoint.Movie.latest
        }
        var method: String {
            return HTTPMethod.GET
        }
    }
}
