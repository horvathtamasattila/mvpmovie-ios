import Combine
import Foundation
import MediaClient

final class MediaDatabaseWorker {
	func loadMediaFromDatabase() -> AnyPublisher<([SearchResult], [SearchResult]), MediaError> {
		let backgroundContext = CoreDataStack.shared.backgroundContext
		let mediaFetchRequest = CDMedia.fetchRequest()

		return Future<([SearchResult], [SearchResult]), MediaError> { promise in
			backgroundContext.perform {
				do {
					let cdMedia = try backgroundContext.fetch(mediaFetchRequest)
					let savedMedia = cdMedia.filter { !$0.isHidden }.map { $0.toMedia() }
					let hiddenMedia = cdMedia.filter { $0.isHidden }.map { $0.toMedia() }

					promise(.success((savedMedia, hiddenMedia)))
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
				_ = media.toCDMedia(context: backgroundContext, isHidden: false)
				if backgroundContext.hasChanges {
					try backgroundContext.save()
				}
			} catch {
				print("Core Data Error")
			}
		}
	}

	func saveHiddenMediaToDatabase(media: SearchResult) {
		let backgroundContext = CoreDataStack.shared.backgroundContext
		backgroundContext.perform {
			do {
				_ = media.toCDMedia(context: backgroundContext, isHidden: true)
				if backgroundContext.hasChanges {
					try backgroundContext.save()
				}
			} catch {
				print("Core Data Error")
			}
		}
	}
}
