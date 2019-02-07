import Foundation

extension TMDB {
    ///Represents data structures and methods for People related API's
    ///
    ///Refer https://developers.themoviedb.org/3/people for details
    public enum People {
        public static func getDetails(_ id: Int64, completion: @escaping ResultCallback<Person>) {
            TMDB.send(PersonGetDetails(id)) { response in
                completion(response)
            }
        }
    }
}
