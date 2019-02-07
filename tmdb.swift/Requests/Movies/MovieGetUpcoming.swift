import Foundation

extension TMDB.Movies {
    internal struct MovieGetUpcoming: APIRequest, APIRequestPageable {
        var page: UInt

        typealias Response = [Movie]

        var resourceName: String {
            return APIEndpoint.Movie.upcoming
        }
        var method: String {
            return HTTPMethod.GET
        }

        init(page: UInt = 1) {
            self.page = page
        }
    }
}
