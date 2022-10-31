import Combine
import Foundation

class SearchViewModel {
	@Published var searchText = ""

	private var subscription: Set<AnyCancellable> = []

	init() {
		$searchText
			.debounce(for: .milliseconds(500), scheduler: RunLoop.main)
			.sink { text in
				print(text)
			}
			.store(in: &subscription)

	}
}
