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
