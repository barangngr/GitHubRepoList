//
//  UserDetailViewModel.swift
//  GithubRepo List
//
//  Created by Baran Gungor on 21.03.2022.
//

import Foundation

protocol UserDetailViewModelDelegate: AnyObject {
    func didFetchRepos()
    func showError(_ error: Error)
}

final class UserDetailViewModel {
    
    // MARK: Properties
    private var page = 1
    var isPagination = false
    var userResponse: UserDetailResponseModel?
    var userReposResponse = [RepositoryDetailResponseModel]()
    weak var delegate: UserDetailViewModelDelegate?
    
    // MARK: Functions
    func fetchUser(_ userName: String?) {
        guard let userName = userName else { return }
        NetworkManager.shared.sendRequest(model: GitAPI.userProfile(userName), type: UserDetailResponseModel.self) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                self.userResponse = response
                self.fetchUserRepos(userName)
            case .failure(let error):
                self.delegate?.showError(error)
            }
        }
    }
    
    func fetchUserRepos(_ userName: String?) {
        guard let userName = userName else { return }
        isPagination = true
        NetworkManager.shared.sendRequest(model: GitAPI.userRepositories(userName), param: ["page": "\(page)"], type: [RepositoryDetailResponseModel].self) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                self.userReposResponse.append(contentsOf: response)
                self.page += 1
                self.isPagination = false
                self.delegate?.didFetchRepos()
            case .failure(let error):
                self.delegate?.showError(error)
            }
        }
    }
    
}
