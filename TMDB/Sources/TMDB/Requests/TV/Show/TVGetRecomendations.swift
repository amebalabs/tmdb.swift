import Foundation

extension TMDB.TV {
    internal struct TVGetRecommendations: APIRequest, APIRequestPageable {
        var page: UInt

        typealias Response = [TVShow]

        var resourceName: String

        var method: String {
            return HTTPMethod.GET
        }

        init(_ id: Int64, page: UInt = 1) {
            self.resourceName = APIEndpoint.TV.recommendations.replacingOccurrences(of: "{tv_id}", with: String(id))
            self.page = page
        }
    }
}
