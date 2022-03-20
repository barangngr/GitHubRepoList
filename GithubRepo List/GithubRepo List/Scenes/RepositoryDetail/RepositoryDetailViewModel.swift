//
//  RepositoryDetailViewModel.swift
//  GithubRepo List
//
//  Created by Baran Gungor on 20.03.2022.
//

import Foundation

protocol RepositoryDetailViewModelDelegate: AnyObject {
    func didFetchRepos(_ data: RepositoryDetailResponseModel)
    func showError(_ error: Error)
}

final class RepositoryDetailViewModel {
    
    // MARK: Properties
    var userName: String?
    var repoName: String?
    private var page = 1
    weak var delegate: RepositoryDetailViewModelDelegate?
        
    // MARK: Functions
    func fetchUserRepos() {
        guard let userName = userName, let repoName = repoName else { return }
        NetworkManager.shared.sendRequest(model: GitAPI.userRepositories(userName), param: ["page": "\(page)"], type: [RepositoryDetailResponseModel].self) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                self.checkRepo(response, repoName: repoName)
            case .failure(let error):
                self.delegate?.showError(error)
            }
        }
    }
    
    private func checkRepo(_ data: [RepositoryDetailResponseModel], repoName: String) {
        if data.contains(where: { $0.name == repoName }) {
            if let repo = data.filter({$0.name == repoName}).first {
                self.delegate?.didFetchRepos(repo)
            }
        } else {
            print("call again")
            page += 1
            fetchUserRepos()
        }
    }
}
