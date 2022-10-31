import Foundation
import MediaClient

extension Array where Element == SearchResult {
	func toRepresentable() -> [SearchResultRepresentable] {
		var result: [SearchResultRepresentable] = []
		for element in self {
			result.append(SearchResultRepresentable(searchResult: element))
		}
		return result
	}
}

struct SearchResultRepresentable: Identifiable {
	let id = UUID()
	let searchResult: SearchResult
}
