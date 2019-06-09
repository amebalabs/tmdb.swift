import Foundation

extension TMDB {
    ///Represents data structures and methods for Movie related API's
    ///
    ///Refer https://developers.themoviedb.org/3/movies for details
    public enum Movies {
        public typealias APIPagedResponse = TMDB.Utility.APIPagedResponse

        public static func getDetails(_ id: Int64, completion: @escaping ResultCallback<Movie>) {
            TMDB.send(GetDetails(id)) { response in
                completion(response)
            }
        }

        public static func getReviews(_ id: Int64, page: UInt = 1, completion: @escaping ResultCallback<APIPagedResponse<[TMDB.Common.Review]>>) {
            TMDB.sendPaged(MovieGetReviews(id, page: page)) { response in
                completion(response)
            }
        }

        public static func getRecommendations(_ id: Int64, page: UInt = 1, completion: @escaping ResultCallback<APIPagedResponse<[Movie]>>) {
            TMDB.sendPaged(MovieGetRecommendations(id, page: page)) { response in
                completion(response)
            }
        }

        public static func getSimilar(_ id: Int64, page: UInt = 1, completion: @escaping ResultCallback<APIPagedResponse<[Movie]>>) {
            TMDB.sendPaged(MovieGetSimilar(id, page: page)) { response in
                completion(response)
            }
        }

        public static func getLists(_ id: Int64, page: UInt = 1, completion: @escaping ResultCallback<APIPagedResponse<[List]>>) {
            TMDB.sendPaged(MovieGetLists(id, page: page)) { response in
                completion(response)
            }
        }

        public static func getLatest(completion: @escaping ResultCallback<Movie>) {
            TMDB.send(MovieGetLatest()) { response in
                completion(response)
            }
        }

        public static func getNowPlaying(page: UInt = 1, completion: @escaping ResultCallback<APIPagedResponse<[Movie]>>) {
            TMDB.sendPaged(MovieGetNowPlaying(page: page)) { response in
                completion(response)
            }
        }

        public static func getPopular(page: UInt = 1, completion: @escaping ResultCallback<APIPagedResponse<[Movie]>>) {
            TMDB.sendPaged(MovieGetPopular(page: page)) { response in
                completion(response)
            }
        }

        public static func getTopRated(page: UInt = 1, completion: @escaping ResultCallback<APIPagedResponse<[Movie]>>) {
            TMDB.sendPaged(MovieGetTopRated(page: page)) { response in
                completion(response)
            }
        }

        public static func getUpcoming(page: UInt = 1, completion: @escaping ResultCallback<APIPagedResponse<[Movie]>>) {
            TMDB.sendPaged(MovieGetUpcoming(page: page)) { response in
                completion(response)
            }
        }
    }
}
