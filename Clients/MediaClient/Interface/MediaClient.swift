import Combine
import Foundation

public struct MediaClient {
	public var getMediaByName: (String) -> AnyPublisher<[SearchResult], MediaError>
    public init(
		getMediaByName: @escaping (String) -> AnyPublisher<[SearchResult], MediaError>
    ) {
        self.getMediaByName = getMediaByName
    }
}
