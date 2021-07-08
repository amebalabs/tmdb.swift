import Foundation

extension TMDB.Utility {
    public enum Result<Value> {
        case success(Value)
        case failure(Error)
    }
}
extension TMDB {
    public typealias ResultCallback<Value> = (TMDB.Utility.Result<Value>) -> Void
}
