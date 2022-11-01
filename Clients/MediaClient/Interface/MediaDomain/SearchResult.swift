import Foundation

public struct SearchResults: Decodable {
	public let results: [SearchResult]
}

public struct SearchResult: Decodable, Hashable {
	private let _title: String?
	private let _name: String?
	private let _overview: String?
	private let _poster_path: String?
	private let _backdrop_path: String?
	private let _vote_average: Double?

	public init(_title: String?, _name: String?, _overview: String?, _poster_path: String?, _backdrop_path: String?, _vote_average: Double?) {
		self._title = _title
		self._name = _name
		self._overview = _overview
		self._poster_path = _poster_path
		self._backdrop_path = _backdrop_path
		self._vote_average = _vote_average
	}

	public var title: String {
		_title ?? _name ?? ""
	}

	public var overview: String {
		_overview ?? ""
	}

	public var poster_path: URL? {
		_poster_path != nil ? URL(string:"\(MediaClient.imageURL)/w154\(_poster_path!)")! : nil
	}

	public var backdrop_path: URL? {
		_backdrop_path != nil ? URL(string:"\(MediaClient.imageURL)/w780\(_backdrop_path!)")! : nil
	}

	public var vote_average: String {
		String(format: "%.1f", _vote_average ?? 0)
	}

	private enum CodingKeys: String, CodingKey {
		case _title = "title"
		case _name = "name"
		case _overview = "overview"
		case _poster_path = "poster_path"
		case _backdrop_path = "backdrop_path"
		case _vote_average = "vote_average"
	}
}
