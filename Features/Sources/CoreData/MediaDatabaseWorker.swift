import Combine
import Foundation
import MediaClient

final class MediaDatabaseWorker {
	func loadMediaFromDatabase() -> AnyPublisher<[SearchResult], MediaError> {
		let backgroundContext = CoreDataStack.shared.backgroundContext
		let mediaFetchRequest = CDMedia.fetchRequest()

		return Future<[SearchResult], MediaError> { promise in
			backgroundContext.perform {
				do {
					let cdMedia = try backgroundContext.fetch(mediaFetchRequest)
					let savedMedia = cdMedia.map { $0.toMedia() }

					promise(.success(savedMedia))
				} catch {
					promise(.failure(MediaError(error: "Core Data Error")))
				}
			}
		}
		.eraseToAnyPublisher()
	}

	func saveMediaToDatabase(media: SearchResult) {
		let backgroundContext = CoreDataStack.shared.backgroundContext
		backgroundContext.perform {
			do {
				_ = media.toCDMedia(context: backgroundContext)
				if backgroundContext.hasChanges {
					try backgroundContext.save()
				}
			} catch {
				print("Core Data Error")
			}
		}
	}
}
