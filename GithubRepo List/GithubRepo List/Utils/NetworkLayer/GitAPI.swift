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

/*
 - When the GithubAPI doc was examined, necessary data could be get different endpoints, but I only used these 3 endpoints, thinking that I had to go to the endpoints specified in the mail sent as per the case.
 */
