//
//  GitAPI.swift
//  GithubRepo List
//
//  Created by Baran Gungor on 18.03.2022.
//

import Foundation

enum GitAPI: BaseAPI {
    
    case repositories
    case userProfile(String)
    case userRepositories(String)
    
    var method: BaseRequestHTTPMethod {
        return .get
    }
    
    var path: String {
        switch self {
        case .repositories:                     return "/repositories"
        case .userProfile(let userName):        return "/users/" + userName
        case .userRepositories(let userName):   return "/users/" + userName + "/repos"
        }
    }
    
}
