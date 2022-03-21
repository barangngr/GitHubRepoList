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
        case .invalidURL:   return "Invalid URL, please try again later."
        case .invalidData:  return "Invalid Data, please try again later."
        }
    }
}
