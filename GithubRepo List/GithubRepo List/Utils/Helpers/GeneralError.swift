//
//  GeneralError.swift
//  GithubRepo List
//
//  Created by Baran Gungor on 18.03.2022.
//

import Foundation

enum GeneralError: Error {
    case invalidURL
    case invalidData
}

extension GeneralError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .invalidURL:   return "Geçersiz URL, lütfen daha sonra tekrar deneyin."
        case .invalidData:  return "Geçersiz Data, lütfen daha sonra tekrar deneyin."
        }
    }
}
