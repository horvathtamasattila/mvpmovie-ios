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
	private let _title: String?
	private let _overview: String?
	private let _poster_path: String?
	private let _vote_average: Double?

	public var title: String {
		_title ?? ""
	}

	public var overview: String {
		_overview ?? ""
	}

	public var poster_path: URL? {
		_poster_path != nil ? URL(string:"\(MediaClient.baseURL)\(_poster_path!)")! : nil
	}

	public var vote_average: String {
		String(format: "%.1f", _vote_average ?? 0)
	}

	private enum CodingKeys: String, CodingKey {
		case _title = "title"
		case _overview = "overview"
		case _poster_path = "poster_path"
		case _vote_average = "vote_average"
	}
}
