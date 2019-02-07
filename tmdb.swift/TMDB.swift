import Foundation

/// TMDb API wrapper
///
/// Comprised of the following sub-components:
/// - Movies
/// - TV
/// - People
/// - Common
/// - Utility

public class TMDB {
    private static let baseEndpoint = "https://api.themoviedb.org/3/"
    internal static let baseImageURL = "https://image.tmdb.org/t/p/"
    private static let session = URLSession(configuration: .default)

    /// TMDb API Key, to retrieve a key follow instructions https://developers.themoviedb.org/3/getting-started/authentication
    /// Override this value or add TMDB_API_KEY to Info.plist
    public static var apiKey = valueForAPIKey("TMDB_API_KEY")

    /// ISO 639-1 value to display translated data for the fields that support it https://developers.themoviedb.org/3/getting-started/languages
    public static var lang: TMDB.Common.ISO6391 = .en

    private static func endpoint<T: APIRequest>(for request: T) -> URL {
        var url = URL(string: "\(baseEndpoint)\(request.resourceName)")!
            .append("api_key", value: apiKey)
            .append("language", value: lang.rawValue)
        request.parameters?.forEach({
            url = url.append($0.key, value: $0.value)
        })
        return url
    }

    internal static func sendPaged<T: APIRequest & APIRequestPageable>(_ request: T, completion: @escaping ResultCallback<TMDB.Utility.APIPagedResponse<T.Response>>) {
        let endpoint = self.endpoint(for: request).append("page", value: String(request.page))

        var urlRequest = URLRequest(url: endpoint)
        urlRequest.httpMethod = request.method
        if request.method == HTTPMethod.POST {
            urlRequest.httpBody = request.body
        }

        let task = session.dataTask(with: urlRequest) { data, _, error in
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .formatted(DateFormatter.iso8601Full)
                    let result = try decoder.decode(TMDB.Utility.APIPagedResponse<T.Response>.self, from: data)

                    completion(.success(result))

                } catch {
                    completion(.failure(error))
                }
            } else if let error = error {
                completion(.failure(error))
            }
        }
        task.resume()
    }

    internal static func send<T: APIRequest>(_ request: T, completion: @escaping ResultCallback<T.Response>) {
        let endpoint = self.endpoint(for: request)

        var urlRequest = URLRequest(url: endpoint)
        urlRequest.httpMethod = request.method
        if request.method == HTTPMethod.POST {
            urlRequest.httpBody = request.body
        }

        let task = session.dataTask(with: urlRequest) { data, _, error in
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .formatted(DateFormatter.iso8601Full)
                    let result = try decoder.decode(T.Response.self, from: data)

                    completion(.success(result))
                } catch {
                    completion(.failure(error))

                }
            } else if let error = error {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}

private func valueForAPIKey(_ keyname: String) -> String {
    guard let filePath = Bundle.main.path(forResource: "Info", ofType: "plist") else {
        print("Can't find Info.plist")
        return ""
    }

    let plist = NSDictionary(contentsOfFile: filePath)

    if let value: String = plist?.object(forKey: keyname) as? String {
        return value
    }
    print("Can't find TMDB_KEY_API in Info.plist")
    return ""
}
