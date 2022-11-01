import Combine
import Foundation
import MediaClient

class SearchViewModel: ObservableObject {
    @Published var searchText = ""
    @Published var searchResults: [SearchResultRepresentable] = []
    @Published var isShowingNotFound = false

    private var searchUseCase: SearchUseCase
    private var subscription: Set<AnyCancellable> = []

    init(searchUseCase: SearchUseCase) {
        self.searchUseCase = searchUseCase
        unowned let unownedSelf = self
        $searchText
            .debounce(for: .milliseconds(500), scheduler: RunLoop.main)
            .removeDuplicates()
            .map { text -> String? in
                if text.count < 1 {
                    unownedSelf.isShowingNotFound = false
                    unownedSelf.searchResults.removeAll()
                    return nil
                }

                return text
            }
            .compactMap { $0 }
            .sink { text in
                unownedSelf.getSearchResults(for: text)
            }
            .store(in: &subscription)
    }

    private func getSearchResults(for title: String) {
        unowned let unownedSelf = self
        searchUseCase.getMediaByTitle(title: title)
            .sink(
                receiveCompletion: { completion in
                    switch completion {
                    case let .failure(error): print(error)
                    default: break
                    }
                },
                receiveValue: { results in
                    guard !results.isEmpty else {
                        unownedSelf.isShowingNotFound = true
                        unownedSelf.searchResults.removeAll()
                        return
                    }
                    let filteredResults = results.filter { $0.title != "" && $0.overview != "" && $0.poster_path != nil }
                    unownedSelf.searchResults = filteredResults.toRepresentable()
                }
            )
            .store(in: &subscription)
    }
}
