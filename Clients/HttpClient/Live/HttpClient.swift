import Alamofire
import Combine
import Foundation
import HttpClient

public class HttpClient {
    private let session: Session

    public init() {
        let configuration = URLSessionConfiguration.default
        configuration.headers = .default
        session = Session(configuration: configuration)
    }

    public func performRequest<T: Decodable>(
        request: URLRequest,
        response: T.Type
    ) -> AnyPublisher<T, ApiError> {
        return session.request(request)
            .validate()
            .publishDecodable(type: T.self)
            .setFailureType(to: ApiError.self)
            .flatMap { (response: DataResponse<T, AFError>) -> AnyPublisher<T, ApiError> in
                switch response.result {
                case let .success(body):
                    return Just(body)
                        .setFailureType(to: ApiError.self)
                        .eraseToAnyPublisher()
                case .failure:
                    if response.isEmptySuccessResponse(reponseType: T.self) {
                        // swiftlint:disable:next force_cast
                        return Just(ApiError() as! T)
                            .setFailureType(to: ApiError.self)
                            .eraseToAnyPublisher()
                    } else {
                        return Fail(error:
                            ApiError(message: response.handleError().localizedDescription))
                            .eraseToAnyPublisher()
                    }
                }
            }
            .eraseToAnyPublisher()
    }
}

public extension AFDataResponse {
    func isEmptySuccessResponse<T>(reponseType: T.Type) -> Bool {
        guard let response: HTTPURLResponse = response else {
            return false
        }
        let statusCode = response.statusCode
        guard statusCode >= 200,
              statusCode <= 299,
              reponseType == Empty.self else {
            return false
        }
        return true
    }

    func handleError() -> HTTPError {
        guard let response: HTTPURLResponse = response,
              case let Result.failure(error) = result else {
            return .unknown
        }
        let statusCode = response.statusCode
        if statusCode >= 200, statusCode <= 299 {
            return .appError(error)
        } else {
            switch statusCode {
            case 400 ... 499:
                return .clientError(statusCode, data)
            case 500 ... 599:
                return .clientError(statusCode, data)
            default:
                return .unknown
            }
        }
    }
}
