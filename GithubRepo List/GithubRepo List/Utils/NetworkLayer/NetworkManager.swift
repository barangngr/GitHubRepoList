//
//  NetworkManager.swift
//  GithubRepo List
//
//  Created by Baran Gungor on 18.03.2022.
//

import Foundation

final class NetworkManager {
    
    // MARK: Properties
    typealias params = [String: String]?
    static var shared: NetworkManager = NetworkManager()
    private var urlSession = URLSession.shared
    private let baseURL = "https://api.github.com"
    
    // MARK: Initiliaze
    private init() {}
    
    // MARK: Functions
    func sendRequest<T: Codable>(model: BaseAPI, param: params = nil, type: T.Type, completion: @escaping (Result<T, Error>) -> Void) {
        
        guard let urlComp = NSURLComponents(string: baseURL + model.path) else {
            completion(.failure(GeneralError.invalidURL))
            return
        }
        
        if let param = param {
            var items = [URLQueryItem]()
            for (key, value) in param {
                items.append(URLQueryItem(name: key, value: value))
            }
            urlComp.queryItems = items
        }
        
        guard let url = urlComp.url else {
            completion(.failure(GeneralError.invalidURL))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = model.method.rawValue
        
        urlSession.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }

            if let data = data {
                do {
                    let dataDecoded = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(dataDecoded))
                    
                } catch let error {
                    completion(.failure(error))
                }
            } else {
                completion(.failure(GeneralError.invalidData))
            }
        }.resume()
    }
        
}
