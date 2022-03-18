//
//  NetworkManager.swift
//  GithubRepo List
//
//  Created by Baran Gungor on 18.03.2022.
//

import Foundation

final class NetworkManager {
    
    // MARK: Properties
    static var shared: NetworkManager = NetworkManager()
    private var urlSession = URLSession.shared
    private let baseURL = "https://api.github.com"
    
    // MARK: Initiliaze
    private init() {}
    
    // MARK: Functions
    func sendRequest<T: Codable>(model: BaseAPI, type: T.Type, completion: @escaping (Result<T, Error>) -> Void) {
        
        guard let url = URL(string: baseURL + model.path) else {
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
