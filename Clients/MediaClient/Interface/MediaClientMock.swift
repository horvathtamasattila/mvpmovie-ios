import Combine
import Foundation

public extension MediaClient {
	static var mock: Self {
		return Self(
			getMediaByName: { _ in Result.Publisher([]).eraseToAnyPublisher() }
		)
	}
}
