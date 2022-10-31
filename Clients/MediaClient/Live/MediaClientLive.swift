import Alamofire
import HttpClientLive
import MediaClient

public extension MediaClient {
	static var live: Self {
		let client = HttpClient()
		return Self(
			getMediaByName: { keyword in
				let request = HttpRequest(
					method: .get,
					url: MediaClient.baseURL,
					path: "/search/multi",
					params: [
						"api_key": MediaClient.apiKey,
						"language": "en-US",
						"query": keyword
					]
				)
				return client.performRequest(request: request.urlRequest, response: SearchResults.self)
					.map { $0.results }
					.mapError { error in
						MediaError(error: error.message)
					}
					.eraseToAnyPublisher()
			}
		)
	}
}
