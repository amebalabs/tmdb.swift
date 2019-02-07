import Foundation

extension TMDB.Movies {
    struct MovieGetNowPlaying: APIRequest, APIRequestPageable {
        var page: UInt

        typealias Response = [Movie]

        var resourceName: String {
            return APIEndpoint.Movie.nowPlaying
        }
        var method: String {
            return HTTPMethod.GET
        }

        init(page: UInt = 1) {
            self.page = page
        }
    }
}
