//
//  UserDetailViewController.swift
//  GithubRepo List
//
//  Created by Baran Gungor on 21.03.2022.
//

import UIKit

final class UserDetailViewController: UIViewController {
    
    // MARK: Properties
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(UserDetailTableViewCell.self, forCellReuseIdentifier: "userDetailTableViewCell")
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()
    
    private var dataSource: [RepositoryDetailResponseModel]?
    private var viewModel = UserDetailViewModel()
    var userName: String?
    
    // MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .backColor
        tableView.dataSource = self
        tableView.delegate = self
        viewModel.delegate = self
        
        showActivityIndicator()
        viewModel.fetchUser(userName)
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
extension UserDetailViewController: UserDetailViewModelDelegate {
    func didFetchUser(_ data: UserDetailResponseModel) {
        hideActivityIndicator()
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func didFetchRepos() {
        hideActivityIndicator()
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

    func showError(_ error: Error) {
        showAlert(error.localizedDescription)
    }
}

extension UserDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.userReposResponse.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userDetailTableViewCell", for: indexPath as IndexPath) as! UserDetailTableViewCell
        cell.configure(viewModel.userReposResponse[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UserDetailTableHeaderView()
        let headerData = viewModel.userResponse
        view.configure(headerData)
        return headerData == nil ? nil : view
    }
        
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let position = scrollView.contentOffset.y
        if position > (tableView.contentSize.height - 100 - scrollView.frame.size.height) && !viewModel.isPagination {
            viewModel.fetchUserRepos(userName)
        }
    }
    
}
