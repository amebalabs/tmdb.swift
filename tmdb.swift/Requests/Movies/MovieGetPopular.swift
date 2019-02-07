import Foundation

extension TMDB.Movies {
    internal struct MovieGetPopular: APIRequest, APIRequestPageable {
        var page: UInt

        typealias Response = [Movie]

        var resourceName: String {
            return APIEndpoint.Movie.popular
        }
        var method: String {
            return HTTPMethod.GET
        }

        init(page: UInt = 1 ) {
            self.page = page
        }
    }
}
