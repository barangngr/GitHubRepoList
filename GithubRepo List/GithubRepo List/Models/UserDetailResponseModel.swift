//
//  UserDetailResponseModel.swift
//  GithubRepo List
//
//  Created by Baran Gungor on 20.03.2022.
//

import Foundation

struct UserDetailResponseModel: Codable {
    let id: Int?
    let login: String?
    let avatarUrl: String?
    let name: String?
    let company: String?
    let location: String?
    let email: String?
    let hireable: Bool?
    let publicRepos: Int?
    let publicGists: Int?
    let followers: Int?
    let following: Int?
    
    enum CodingKeys: String, CodingKey {
        case id
        case login
        case avatarUrl = "avatar_url"
        case name
        case company
        case location
        case email
        case hireable
        case publicRepos = "public_repos"
        case publicGists = "public_gists"
        case followers
        case following
    }
}
