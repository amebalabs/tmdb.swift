import Foundation

extension TMDB {
    ///Represents data structures and methods for TV related API's
    ///
    ///Refer for details:
    ///- https://developers.themoviedb.org/3/tv
    ///- https://developers.themoviedb.org/3/tv-seasons
    ///- https://developers.themoviedb.org/3/tv-episodes
    public enum TV {
        public typealias APIPagedResponse = TMDB.Utility.APIPagedResponse

        public static func getDetails(_ id: Int64, completion: @escaping ResultCallback<TVShow>) {
            TMDB.send(TVGetDetails(id)) { response in
                completion(response)
            }
        }

        public static func getSeasonDetails(_ id: Int64, season: UInt, completion: @escaping ResultCallback<TVSeason>) {
            TMDB.send(TVSeasonGetDetails(id, season: season)) { response in
                completion(response)
            }
        }

        public static func getEpisodeDetails(_ id: Int64, season: UInt, episode: UInt, completion: @escaping ResultCallback<TVEpisode>) {
            TMDB.send(TVEpisodeGetDetails(id, season: season, episode: episode)) { response in
                completion(response)
            }
        }

        public static func getRecommendations(_ id: Int64, page: UInt = 1, completion: @escaping ResultCallback<APIPagedResponse<[TVShow]>>) {
            TMDB.sendPaged(TVGetRecommendations(id, page: page)) { response in
                completion(response)
            }
        }

        public static func getSimilar(_ id: Int64, page: UInt = 1, completion: @escaping ResultCallback<APIPagedResponse<[TVShow]>>) {
            TMDB.sendPaged(TVGetSimilar(id, page: page)) { response in
                completion(response)
            }
        }

        public static func getLatest(completion: @escaping ResultCallback<TVShow>) {
            TMDB.send(TVGetLatest()) { response in
                completion(response)
            }
        }

        public static func getAiringToday(page: UInt = 1, completion: @escaping ResultCallback<APIPagedResponse<[TVShow]>>) {
            TMDB.sendPaged(TVGetAiringToday(page: page)) { response in
                completion(response)
            }
        }

        public static func getOnAir(page: UInt = 1, completion: @escaping ResultCallback<APIPagedResponse<[TVShow]>>) {
            TMDB.sendPaged(TVGetOnAir(page: page)) { response in
                completion(response)
            }
        }

        public static func getPopular(page: UInt = 1, completion: @escaping ResultCallback<APIPagedResponse<[TVShow]>>) {
            TMDB.sendPaged(TVGetPopular(page: page)) { response in
                completion(response)
            }
        }

        public static func getTopRated(page: UInt = 1, completion: @escaping ResultCallback<APIPagedResponse<[TVShow]>>) {
            TMDB.sendPaged(TVGetTopRated(page: page)) { response in
                completion(response)
            }
        }

    }
}
