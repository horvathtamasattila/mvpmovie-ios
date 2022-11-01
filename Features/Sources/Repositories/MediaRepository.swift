import Combine
import MediaClient

final class MediaRepository: ObservableObject {
	@Published private var savedMedia: [SearchResult]
	@Published private var hiddenMedia: [SearchResult]

	private let databaseWorker: MediaDatabaseWorker
	private var subscription: Set<AnyCancellable> = []
	init(databaseWorker: MediaDatabaseWorker) {
		self.savedMedia = []
		self.hiddenMedia = []
		self.databaseWorker = databaseWorker

		unowned let unownedSelf = self
		self.databaseWorker.loadMediaFromDatabase()
			.sink(
				receiveCompletion: { completion in
					switch completion {
					case let .failure(error): print(error)
					default: break
					}
				},
				receiveValue: { savedMedia, hiddenMedia in
					unownedSelf.savedMedia = savedMedia
					unownedSelf.hiddenMedia = hiddenMedia
				}
			)
			.store(in: &subscription)
	}

	func saveMedia(media: SearchResult) {
		savedMedia.append(media)
		databaseWorker.saveMediaToDatabase(media: media)
	}

	func hideMedia(media: SearchResult) {
		hiddenMedia.append(media)
		databaseWorker.saveHiddenMediaToDatabase(media: media)
	}

	func getSavedMedia() -> [SearchResult] {
		savedMedia
	}

	func getHiddenMedia() -> [SearchResult] {
		hiddenMedia
	}
}
