//
//  RepositoryDetailViewModel.swift
//  GithubRepo List
//
//  Created by Baran Gungor on 20.03.2022.
//

import Foundation

protocol RepositoryDetailViewModelDelegate: AnyObject {
    func didFetchRepos(_ data: RepositoryDetailModel)
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
                setDataSource(repo)
            }
        } else {
            page += 1
            fetchUserRepos()
        }
    }
    
    private func setDataSource(_ data: RepositoryDetailResponseModel) {
        var infoModel = [RepoInfoModel]()
        infoModel.append(RepoInfoModel(key: "Repo Name", value: data.name))
        infoModel.append(RepoInfoModel(key: "Username", value: data.owner?.login))
        infoModel.append(RepoInfoModel(key: "Description", value: data.description))
        infoModel.append(RepoInfoModel(key: "Language", value: data.language))
        infoModel.append(RepoInfoModel(key: "Default Branch Name", value: data.defaultBranch))
        infoModel.append(RepoInfoModel(key: "Forks Count", value: String(describing: data.forksCount ?? 0)))
        infoModel.append(RepoInfoModel(key: "Visibility", value: data.visibility))
        infoModel.append(RepoInfoModel(key: "Watchers Count", value: String(describing: data.watchersCount ?? 0)))
        infoModel.append(RepoInfoModel(key: "Open Issues Count", value: String(describing: data.openIssuesCount ?? 0)))
        infoModel.append(RepoInfoModel(key: "Size", value: String(describing: data.size ?? 0)))
        
        let dataSource = RepositoryDetailModel(repoInfos: infoModel, avatarURL: data.owner?.avatarUrl)
        delegate?.didFetchRepos(dataSource)
    }
}
