import Combine
import Foundation
import MediaClient

class SearchUseCase {
	private let mediaClient: MediaClient
	private let mediaRepository: MediaRepository

	init(mediaClient: MediaClient, mediaRepository: MediaRepository) {
		self.mediaClient = mediaClient
		self.mediaRepository = mediaRepository
	}

	func getMediaByTitle(title: String) -> AnyPublisher<[SearchResult], MediaError> {
		unowned let unownedSelf = self
		return mediaClient.getMediaByName(title)
		.flatMap { result -> AnyPublisher<[SearchResult], MediaError> in
			let filteredResult = result.filter { !unownedSelf.mediaRepository.getHiddenMedia().contains($0) }
			return Result.Publisher(filteredResult).eraseToAnyPublisher()
		}
		.eraseToAnyPublisher()
			
	}
}
