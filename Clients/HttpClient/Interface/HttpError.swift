import Foundation

public struct ApiError: Error, Equatable {
    public let message: String?

    public init(message: String? = nil) {
        self.message = message
    }
}

public enum HTTPError: Error {
    case networkUnavailable(URLError? = nil)
    case clientError(Int, Data?)
    case serverError(Int, Data?)
    case appError(Error)
    case invalidUrl
    case unknown
}
