import Combine
import MediaClient

final class MediaRepository: ObservableObject {
	@Published private(set) var savedMedia: [SearchResult]

	private let databaseWorker: MediaDatabaseWorker
	private var subscription: Set<AnyCancellable> = []
	init(databaseWorker: MediaDatabaseWorker) {
		self.savedMedia = []
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
				receiveValue: { media in
					unownedSelf.savedMedia = media
				}
			)
			.store(in: &subscription)
	}

	func saveMedia(media: SearchResult) {
		savedMedia.append(media)
		databaseWorker.saveMediaToDatabase(media: media)
	}

	func getSavedMedia() -> [SearchResult] {
		savedMedia
	}
}
