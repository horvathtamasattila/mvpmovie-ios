import Alamofire
import Foundation

public struct HttpRequest {
    public let method: HTTPMethod
    public let url: String
    public let path: String
    public let queryItems: [String: String?]?
    public let params: [String: Any]?
    public let encoding: ParameterEncoding
    public let headers: [(String, String)]?

    public init(
        method: HTTPMethod = .get,
        url: String,
        path: String,
        queryItems: [String: String?]? = nil,
        params: [String: Any]? = nil,
        encoding: ParameterEncoding = URLEncoding.default,
        headers: [(String, String)]? = nil
    ) {
        self.method = method
        self.url = url
        self.path = path
        self.queryItems = queryItems
        self.params = params
        self.encoding = encoding
        self.headers = headers
    }

    public var urlRequest: URLRequest {
        // swiftlint:disable:next force_unwrapping
        var components = URLComponents(string: url)!
        var componentsQueryItems: [URLQueryItem] = []
        queryItems?.forEach { name, value in
            let queryItem = URLQueryItem(
                name: name,
                value: value
            )
            componentsQueryItems.append(queryItem)
        }
        components.queryItems = componentsQueryItems

        // swiftlint:disable:next force_unwrapping
        var request = URLRequest(url: components.url!.appendingPathComponent(path))
        request.httpMethod = method.rawValue
        if let headers = headers {
            headers.forEach { name, value in request.setValue(value, forHTTPHeaderField: name) }
        }

        // swiftlint:disable:next force_try
        return try! encoding.encode(request, with: params)
    }
}
