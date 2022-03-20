//
//  RepositoryDetailResponseModel.swift
//  GithubRepo List
//
//  Created by Baran Gungor on 20.03.2022.
//

import Foundation

struct RepositoryDetailResponseModel: Codable {
    let id: Int?
    let name: String?
    let fullName: String?
    let description: String?
    let owner: OwnerResponseModel?
    let language: String?
    let forksCount: Int?
    let stargazersCount: Int?
    let watchersCount: Int?
    let size: Int?
    let defaultBranch: String?
    let openIssuesCount: Int?
    let visibility: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case fullName = "full_name"
        case description
        case owner
        case language
        case forksCount = "forks_count"
        case stargazersCount = "stargazers_count"
        case watchersCount = "watchers_count"
        case size
        case defaultBranch = "default_branch"
        case openIssuesCount = "open_issues_count"
        case visibility
    }
}
