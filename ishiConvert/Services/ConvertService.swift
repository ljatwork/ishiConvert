//
//  APIManager.swift
//  ishiConvert
//
//  Created by Leah Joy Ylaya on 7/6/22.
//

import Combine
import Foundation

enum NetworkError : Error {
    case internalError
    case timeOut
    case parsingError
    case serverError
    case apiKeyMissing
}

protocol ConvertServiceProvider {
    func getLatest() -> AnyPublisher<Latest, NetworkError>
}

class ConvertService: ConvertServiceProvider {
    var url: String = "https://openexchangerates.org/"
    
    private enum EndPoint: String {
        case latest = "api/latest.json"
    }
    
    func getLatest() -> AnyPublisher<Latest, NetworkError> {
        call(endpoint: .latest)
    }
    
    private func request(endpoint: EndPoint) -> URLRequest {
        let apiKey = Bundle.main.object(forInfoDictionaryKey: "APP_ID") as? String
        guard let key = apiKey, !key.isEmpty else {
            preconditionFailure("API key missing")
        }
        
        let path = "\(url)\(endpoint)?app_id=\(key)"
        guard let apiUrl = URL(string: path) else {
            preconditionFailure("Bad URL")
        }
        
        var request = URLRequest(url: apiUrl)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = ["Content-Type": "application/json"]
        return request
    }
    
    
    private func call<T:Codable>(endpoint: EndPoint) -> AnyPublisher<T, NetworkError> {
        let urlRequest = request(endpoint: endpoint)
        
        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .mapError { _ in NetworkError.serverError }
            .map { $0.data }
            .decode(type: T.self, decoder: JSONDecoder())
            .mapError { _ in NetworkError.parsingError }
            .eraseToAnyPublisher()
    }
}
