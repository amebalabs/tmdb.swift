import Foundation

extension TMDB {
    ///Helper types and methods
    public enum Utility {
        public static func getImageURL(_ path: String?, size: TMDBImageSizeProtocol = ImageSize.Backdrop.original) -> URL? {
            guard let path =  path else {
                return nil
            }
            return URL(string: "\(baseImageURL)\(size)\(path)")
        }
    }
}
