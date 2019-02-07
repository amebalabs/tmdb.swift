import Foundation

extension TMDB.TV {
    internal struct TVGetSimilar: APIRequest, APIRequestPageable {
        var page: UInt

            typealias Response = [TVShow]

            var resourceName: String

            var method: String {
                return HTTPMethod.GET
            }

            init(_ id: Int64, page: UInt = 1) {
                self.resourceName = APIEndpoint.TV.similar.replacingOccurrences(of: "{tv_id}", with: String(id))
                self.page = page
            }
    }
}
