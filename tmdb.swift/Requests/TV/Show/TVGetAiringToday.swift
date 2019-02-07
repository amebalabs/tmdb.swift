import Foundation

extension TMDB.TV {
    internal struct TVGetAiringToday: APIRequest, APIRequestPageable {
        var page: UInt

        typealias Response = [TVShow]

        var resourceName: String {
            return APIEndpoint.TV.airingToday
        }

        var method: String {
            return HTTPMethod.GET
        }

        init(page: UInt = 1) {
            self.page = page
        }
    }
}
