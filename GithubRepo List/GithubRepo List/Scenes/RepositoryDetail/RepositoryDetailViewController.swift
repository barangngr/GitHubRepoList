//
//  RepositoryDetailViewController.swift
//  GithubRepo List
//
//  Created by Baran Gungor on 20.03.2022.
//

import UIKit

final class RepositoryDetailViewController: UIViewController {
    
    // MARK: Properties
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(RepositoryDetailViewTableViewCell.self, forCellReuseIdentifier: "repositoryDetailViewTableViewCell")
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()
    
    private var dataSource: RepositoryDetailModel?
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
    func didFetchRepos(_ data: RepositoryDetailModel) {
        hideActivityIndicator()
        dataSource = data
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func showError(_ error: Error) {
        showAlert(error.localizedDescription)
    }
}

extension RepositoryDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource?.repoInfos?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "repositoryDetailViewTableViewCell", for: indexPath as IndexPath) as! RepositoryDetailViewTableViewCell
        cell.configure(dataSource?.repoInfos?[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = RepositoryTableHeaderView()
        view.delegate = self
        view.configure(dataSource?.avatarURL)
        return dataSource == nil ? nil : view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 350
    }
    
}

extension RepositoryDetailViewController: RepositoryTableHeaderViewDelegate {
    func didTapImage() {
        let vc = UserDetailViewController()
        vc.userName = viewModel.userName
        navigationController?.pushViewController(vc, animated: true)
    }
}
