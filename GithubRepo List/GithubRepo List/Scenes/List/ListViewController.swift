//
//  ViewController.swift
//  GithubRepo List
//
//  Created by Baran Gungor on 18.03.2022.
//

import UIKit

final class ListViewController: UIViewController {

    // MARK: Properties
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(ListViewTableViewCell.self, forCellReuseIdentifier: "listViewTableViewCell")
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.contentInset.top = 5
        return tableView
    }()
    
    private var dataSource = [ListResponseModel]()
    private var viewModel = ListViewModel()
    
    // MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .backColor
        tableView.dataSource = self
        tableView.delegate = self
        viewModel.delegate = self
        
        viewModel.fethcRepos()
        configureViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNavColors(.navColor, textColor: .white)
        title = "Repositories"
    }
    
    // MARK: Functions
    private func configureViews() {
        view.addSubview(views: tableView)
        tableView.fill(.all)
    }

}

// MARK: - Extensions
extension ListViewController: ListViewModelDelegate {
    func didFetchRepos(_ data: [ListResponseModel]) {
        dataSource = data
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func showError(_ error: Error) {
        showAlert(error.localizedDescription)
    }
}

extension ListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listViewTableViewCell", for: indexPath as IndexPath) as! ListViewTableViewCell
        cell.configure(dataSource[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let userName = dataSource[indexPath.row].owner?.login
        let repoName = dataSource[indexPath.row].name
        let vc = RepositoryDetailViewController(userName, repoName: repoName)
        navigationController?.pushViewController(vc, animated: true)
    }
}
