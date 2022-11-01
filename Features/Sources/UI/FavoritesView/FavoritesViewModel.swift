import Foundation
import MediaClient

final class FavoritesViewModel: ObservableObject {
	@Published var favorites: [SearchResult]
	private let mediaUseCase: MediaUseCase

	init(mediaUseCase: MediaUseCase) {
		self.favorites = []
		self.mediaUseCase = mediaUseCase
	}

	func getSavedMedia() {
		favorites = mediaUseCase.getSavedMedia()
	}

}
