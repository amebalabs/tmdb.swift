import Foundation

private enum RequestExtenders: String, CaseIterable {
    case images
    case videos
    case credits
    case external_ids
    case translations
}

extension TMDB.TV {
    internal struct TVEpisodeGetDetails: APIRequest {
        typealias Response = TVEpisode

        var resourceName: String

        var method: String {
            return HTTPMethod.GET
        }

        var parameters: [String: String]? {
            return ["append_to_response": RequestExtenders.allCases.map({$0.rawValue}).joined(separator: ",")]
        }
        init(_ id: Int64, season: UInt, episode: UInt, page: Int = 1) {
            self.resourceName = APIEndpoint.TV.Episode.details
                .replacingOccurrences(of: "{tv_id}", with: String(id))
                .replacingOccurrences(of: "{season}", with: String(season))
                .replacingOccurrences(of: "{episode}", with: String(episode))

        }
    }
}
