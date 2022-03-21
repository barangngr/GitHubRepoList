//
//  ListResponseModel.swift
//  GithubRepo List
//
//  Created by Baran Gungor on 18.03.2022.
//

import Foundation

struct ListResponseModel: Codable {
    let id: Int?
    let name: String?
    let fullName: String?
    let nodeId: String?
    let isPrivate: Bool?
    let owner: OwnerResponseModel?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case fullName = "full_name"
        case nodeId = "node_id"
        case isPrivate = "private"
        case owner
    }
}

// MARK: - OwnerResponseModel
struct OwnerResponseModel: Codable {
    let id: Int?
    let login: String?
    let avatarUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case login
        case avatarUrl = "avatar_url"
    }
}
