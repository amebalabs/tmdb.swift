import Foundation

internal protocol APIRequest: Encodable {

    associatedtype Response: Decodable

    var resourceName: String { get }
    var method: String { get }
    var body: Data? { get }
    var parameters: [String: String]? {get}
}

extension APIRequest {
    var parameters: [String: String]? {
        return nil
    }
    var body: Data? {
        return nil
    }
}

internal protocol APIRequestPageable: Encodable {
    var page: UInt {get}
}
