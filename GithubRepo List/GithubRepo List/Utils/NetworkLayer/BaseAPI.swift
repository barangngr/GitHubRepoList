//
//  BaseAPI.swift
//  GithubRepo List
//
//  Created by Baran Gungor on 18.03.2022.
//

import Foundation

protocol BaseAPI {
    var method: BaseRequestHTTPMethod { get }
    var path: String { get }
}

enum BaseRequestHTTPMethod: String {
    case get = "GET"
    case post = "POST"
}
