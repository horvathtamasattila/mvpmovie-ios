import Foundation

public struct SearchResults: Decodable {
	public let results: [SearchResult]
}

public struct SearchResult: Decodable {
	private let _title: String?
	private let _name: String?
	private let _overview: String?
	private let _poster_path: String?
	private let _vote_average: Double?

	public var title: String {
		_title ?? _name ?? ""
	}

	public var overview: String {
		_overview ?? ""
	}

	public var poster_path: URL? {
		_poster_path != nil ? URL(string:"\(MediaClient.imageURL)\(_poster_path!)")! : nil
	}

	public var vote_average: String {
		String(format: "%.1f", _vote_average ?? 0)
	}

	private enum CodingKeys: String, CodingKey {
		case _title = "title"
		case _name = "name"
		case _overview = "overview"
		case _poster_path = "poster_path"
		case _vote_average = "vote_average"
	}
}
