import Foundation

internal enum APIEndpoint {
    internal enum Movie {
    static let details              = "movie/{movie_id}"
        static let titles           = "movie/{movie_id}/alternative_titles"
        static let recommendations  = "movie/{movie_id}/recommendations"
        static let similar          = "movie/{movie_id}/similar"
        static let lists            = "movie/{movie_id}/lists"
        static let images           = "movie/{movie_id}/images"
        static let reviews          = "movie/{movie_id}/reviews"
        static let credits          = "movie/{movie_id}/credits"
        static let latest           = "movie/latest"
        static let nowPlaying       = "movie/now_playing"
        static let popular          = "movie/popular"
        static let topRated         = "movie/top_rated"
        static let upcoming         = "movie/upcoming"
    }

    internal enum TV {
        static let details          = "tv/{tv_id}"
        static let recommendations  = "tv/{tv_id}/recommendations"
        static let similar          = "tv/{tv_id}/similar"
        static let latest           = "tv/latest"
        static let airingToday      = "tv/airing_today"
        static let onAir            = "tv/on_the_air"
        static let popular          = "tv/popular"
        static let topRated         = "tv/top_rated"

        internal enum Season {
            static let details = "tv/{tv_id}/season/{season}"
        }

        internal enum Episode {
            static let details = "tv/{tv_id}/season/{season}/episode/{episode}"
        }
    }

    internal enum People {
        static let details = "person/{person_id}"
    }
}
