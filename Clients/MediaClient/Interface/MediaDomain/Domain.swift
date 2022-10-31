import Foundation

public extension MediaClient {
    // swiftlint:disable force_cast force_unwrapping
    static let baseURL = Bundle.main.object(forInfoDictionaryKey: "BASE_URL") as! String
	static let apiKey = Bundle.main.object(forInfoDictionaryKey: "API_KEY") as! String
}

public struct MediaError: Error {
    public let message: String?

    public init(error: String?) {
        self.message = error
    }
}

public struct SearchResults: Decodable {
	public let results: [SearchResult]
}

public struct SearchResult: Decodable {
	public let title: String?
}
