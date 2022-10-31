import Combine
import Foundation
import MediaClient

class SearchUseCase {
	private let mediaClient: MediaClient

	init(mediaClient: MediaClient) {
		self.mediaClient = mediaClient
	}

	func getMediaByTitle(title: String) -> AnyPublisher<[SearchResult], MediaError> {
		mediaClient.getMediaByName(title)
	}
}
