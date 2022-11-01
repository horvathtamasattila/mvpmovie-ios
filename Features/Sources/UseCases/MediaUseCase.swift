import Combine
import Foundation
import MediaClient

class MediaUseCase {
	private let mediaClient: MediaClient
	let mediaRepository: MediaRepository

	init(mediaClient: MediaClient, mediaRepository: MediaRepository) {
		self.mediaClient = mediaClient
		self.mediaRepository = mediaRepository
	}

	func saveMedia(media: SearchResult) {
		mediaRepository.saveMedia(media: media)
	}

	func getSavedMedia() -> [SearchResult] {
		mediaRepository.getSavedMedia()
	}
}
