import Foundation
import Alamofire

enum SeatGeekAPI {
    static let baseURL = "https://api.seatgeek.com/2"
    static let clientID = "MjI1MDg1NTZ8MTYyNjExMDA1MS42MjQ4NDQ"
    static let dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
    enum EndPoints {
        static let events = "/events"
    }
}

protocol WebService_Protocol {
    func events(searchQuery: String, completion: @escaping (Result<[Event], Error>) -> Void)
}

class WebService: WebService_Protocol {
    
    private let httpClient: HTTPClient_Protocol
    private let jsonDecoder: JSONDecoder

    init(httpClient: HTTPClient_Protocol = HTTPClient()) {
        self.httpClient = httpClient
        
        self.jsonDecoder = JSONDecoder()
        self.jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = SeatGeekAPI.dateFormat
        self.jsonDecoder.dateDecodingStrategy = .formatted(dateFormatter)
    }
    
    struct EventsResponseBody: Decodable {
        let events: [Event]
    }
    
    func events(searchQuery: String = "", completion: @escaping (Result<[Event], Error>) -> Void) {
        var urlString = String(format: "%@%@?client_id=%@", SeatGeekAPI.baseURL, SeatGeekAPI.EndPoints.events, SeatGeekAPI.clientID)
        if searchQuery != "" {
            urlString += "&q=" + searchQuery
        }
        let request = HTTPRequest(url: URL(string: urlString)!)
        httpClient.send(request: request) { result in
            switch result {
            case let .success(value):
                completion(Result(catching: { try self.jsonDecoder.decode(EventsResponseBody.self, from: value).events }))
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }

}
