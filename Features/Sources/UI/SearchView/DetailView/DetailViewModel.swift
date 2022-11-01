import Foundation
import MediaClient

final class DetailViewModel: ObservableObject {
	@Published var isSaved: Bool
	@Published var isHidden: Bool
	private let mediaUseCase: MediaUseCase

	init(mediaUseCase: MediaUseCase) {
		self.mediaUseCase = mediaUseCase
		self.isSaved = false
		self.isHidden = false
	}

	func saveTapped(media: SearchResult) {
		if !isSaved {
			mediaUseCase.saveMedia(media: media)
			isSaved.toggle()
		}
	}

	func hideTapped(media: SearchResult) {
		if !isHidden {
			mediaUseCase.hideMedia(media: media)
			isHidden.toggle()
		}
	}
}
