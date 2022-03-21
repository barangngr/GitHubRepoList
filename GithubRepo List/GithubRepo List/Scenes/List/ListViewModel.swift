//
//  ListViewModel.swift
//  GithubRepo List
//
//  Created by Baran Gungor on 18.03.2022.
//

import Foundation

protocol ListViewModelDelegate: AnyObject {
    func didFetchRepos(_ data: [ListResponseModel])
    func showError(_ error: Error)
}

final class ListViewModel {
    
    // MARK: Properties
    weak var delegate: ListViewModelDelegate?
    
    // MARK: Functions
    func fethcRepos() {
        NetworkManager.shared.sendRequest(model: GitAPI.repositories, type: [ListResponseModel].self) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                self.delegate?.didFetchRepos(response)
            case .failure(let error):
                self.delegate?.showError(error)
            }
        }
    }
    
}
