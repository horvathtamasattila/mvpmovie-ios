import Combine
import MediaClient

final class MediaRepository: ObservableObject {
	@Published private(set) var savedMedia: [SearchResult]

	init() {
		self.savedMedia = []
	}

	func saveMedia(media: SearchResult) {
		savedMedia.append(media)
	}

	func getSavedMedia() -> [SearchResult] {
		savedMedia
	}
}
