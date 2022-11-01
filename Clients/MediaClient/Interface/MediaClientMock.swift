import Combine
import Foundation

public extension MediaClient {
	static var mock: Self {
		return Self(
			getMediaByName: { _ in
				let resource = "get_search_results_200"
				let decoder = JSONDecoder()
				do {
					let url = Bundle.main.url(forResource: resource, withExtension: "json")
					let data = try Data(contentsOf: url!)
					let result = try decoder.decode(SearchResults.self, from: data)
					return Result.Publisher(result.results).eraseToAnyPublisher()
				} catch {
					print(error)
					return Result.Publisher([]).eraseToAnyPublisher()
				}
			}
		)
	}
}

public extension SearchResult {
	static var mock: Self {
		SearchResult(
			_title: "Test",
			_name: "Test",
			_overview: "Test",
			_poster_path: "/gh4cZbhZxyTbgxQPxD0dOudNPTn.jpg",
			_backdrop_path: "/14QbnygCuTO0vl7CAFmPf1fgZfV.jpg",
			_vote_average: 5
		)
	}
}
