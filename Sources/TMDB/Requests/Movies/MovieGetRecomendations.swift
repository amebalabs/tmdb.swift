import Foundation

extension TMDB.Movies {
    internal struct MovieGetRecommendations: APIRequest, APIRequestPageable {
        var page: UInt

        typealias Response = [Movie]

        var resourceName: String

        var method: String {
            return HTTPMethod.GET
        }

        init(_ id: Int64, page: UInt = 1) {
            self.resourceName = APIEndpoint.Movie.recommendations.replacingOccurrences(of: "{movie_id}", with: String(id))
            self.page = page
        }
    }
}
