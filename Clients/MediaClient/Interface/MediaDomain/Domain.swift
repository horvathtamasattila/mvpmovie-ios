import Foundation

public extension MediaClient {
    // swiftlint:disable force_cast force_unwrapping
    static let baseURL = Bundle.main.object(forInfoDictionaryKey: "BASE_URL") as! String
	static let imageURL = Bundle.main.object(forInfoDictionaryKey: "IMAGE_URL") as! String
	static let apiKey = Bundle.main.object(forInfoDictionaryKey: "API_KEY") as! String
}

public struct MediaError: Error {
    public let message: String?

    public init(error: String?) {
        self.message = error
    }
}
