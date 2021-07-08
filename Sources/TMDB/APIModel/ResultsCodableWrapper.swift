import Foundation

extension TMDB.Utility {
    public struct Results<Results: Codable>: Codable {
        public let results: Results
    }
}

extension TMDB.TV {
    public typealias Results = TMDB.Utility.Results
}

extension TMDB.Movies {
    public typealias Results = TMDB.Utility.Results
}
