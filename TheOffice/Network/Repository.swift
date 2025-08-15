//
//  Repository.swift
//  HelloWorld
//
//  Created by Adriano Rodrigues Vieira on 06/08/25.
//

import Foundation

class Repository<R: RawRequest> {
    func doRequest<D: Decodable>(_ request: R, performing completion: @escaping ResultHandler<D>) {
        let path = request.path
        guard let url = URL(string: path) else {
            completion(.failure(.generic("Invalid url path: \(path)")))
            return
        }

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.method.rawValue
        urlRequest.url?.append(queryItems: request.queryItems)

        Logger.logRequest(urlRequest)

        let sessionConfig = URLSessionConfiguration.default
        sessionConfig.requestCachePolicy = .returnCacheDataElseLoad        

        let session = URLSession(configuration: sessionConfig)

        if let cachedData = getCachedResponse(for: request.path) {
            Logger.logSuccess(cachedData, fromCache: true)
            handleSuccess(using: cachedData, performing: completion)
            return 
        }

        let task = session.dataTask(with: urlRequest) { data, response, error in
            if let error {
                Logger.logError(error)
                completion(.failure(.generic(error.localizedDescription)))
                return
            }

            if let data {
                if request.cache, let response = response as? HTTPURLResponse, (200...201) ~= response.statusCode {
                    CacheManager.save(data: data, withKey: request.path)
                }

                self.handleSuccess(using: data, performing: completion)
            } else {
                Logger.logError(ApiError.noResponse)
                completion(.failure(.noResponse))
            }
        }
        task.resume()
    }

    private func getCachedResponse(for key: String) -> Data? {
        CacheManager.retrieveData(withKey: key)
    }

    private func handleSuccess<D: Decodable>(using data: Data, performing completion: @escaping ResultHandler<D>) {
        Logger.logSuccess(data)
        if let decoded = try? JSONDecoder().decode(D.self, from: data) {
            completion(.success(decoded))
        } else {
            Logger.logError(ApiError.decodingError)
            completion(.failure(.decodingError))
        }
    }
}

protocol RawRequest {
    var method: Method { get }
    var queryItems: [Foundation.URLQueryItem] { get }
    var path: String { get }
    var cache: Bool { get }
}

enum Method: String {
    case get, post, put, delete, path, options
}
