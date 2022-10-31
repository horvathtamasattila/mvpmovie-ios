import Combine
import Foundation
import MediaClient

class MediaUseCase {
	private let mediaClient: MediaClient

	init(mediaClient: MediaClient) {
		self.mediaClient = mediaClient
	}
}
