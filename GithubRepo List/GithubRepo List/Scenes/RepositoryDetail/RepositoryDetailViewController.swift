//
//  RepositoryDetailViewController.swift
//  GithubRepo List
//
//  Created by Baran Gungor on 20.03.2022.
//

import UIKit

class RepositoryDetailViewController: UIViewController {
    
    // MARK: Properties
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(ListViewTableViewCell.self, forCellReuseIdentifier: "listViewTableViewCell")
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.contentInset.top = 5
        return tableView
    }()
    
    private var dataSource = [RepositoryDetailResponseModel]()
    private var viewModel = RepositoryDetailViewModel()
    
    // MARK: Initiliaze
    convenience init(_ userName: String?, repoName: String?) {
        self.init()
        viewModel.repoName = repoName
        viewModel.userName = userName
    }
    
    // MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .backColor
        tableView.dataSource = self
        tableView.delegate = self
        viewModel.delegate = self
        
        showActivityIndicator()
        viewModel.fetchUserRepos()
        configureViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = "Repository Detail"
        setNavColors(.navColor, textColor: .white)
        setNavBackButton()
    }
  
    // MARK: Functions
    private func configureViews() {
        view.addSubview(views: tableView)
        tableView.fill(.all)
    }
}

// MARK: - Extension
extension RepositoryDetailViewController: RepositoryDetailViewModelDelegate {
    func didFetchRepos(_ data: RepositoryDetailResponseModel) {
        print(data)
        hideActivityIndicator()
    }
    
    func showError(_ error: Error) {
        showAlert(error.localizedDescription)
    }
}

extension RepositoryDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listViewTableViewCell", for: indexPath as IndexPath) as! ListViewTableViewCell
        return cell
    }
    
}
