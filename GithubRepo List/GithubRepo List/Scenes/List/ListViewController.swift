//
//  ViewController.swift
//  GithubRepo List
//
//  Created by Baran Gungor on 18.03.2022.
//

import UIKit

class ListViewController: UIViewController {

    // MARK: Properties
    private var viewModel = ListViewModel()
    
    // MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        viewModel.delegate = self
        viewModel.fethcRepos()
    }
    
    // MARK: Functions


}

// MARK: - Extensions
extension ListViewController: ListViewModelDelegate {
    func didFetchRepos(_ data: [ListResponseModel]) {
        print(data.count)
    }
}

