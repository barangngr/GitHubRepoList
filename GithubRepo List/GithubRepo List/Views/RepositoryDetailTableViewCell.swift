//
//  RepositoryDetailTableViewCell.swift
//  GithubRepo List
//
//  Created by Baran Gungor on 20.03.2022.
//

import UIKit

final class RepositoryDetailViewTableViewCell: BaseTableViewCell {
    
    // MARK: Functions
    override func commonInit() {
        super.commonInit()
        containerView.addSubview(views: headerLabel, descpLabel)
            
        headerLabel.fill(.horizontal, constant: 15)
        headerLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 5).isActive = true
        headerLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        descpLabel.fill(.horizontal, constant: 15)
        descpLabel.topAnchor.constraint(equalTo: headerLabel.bottomAnchor).isActive = true
        descpLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -5).isActive = true
        descpLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        setLabels()
    }
    
    func setLabels() {
        containerView.backgroundColor = .clear
        
        headerLabel.textAlignment = .center
        descpLabel.textAlignment = .center
    }
    
    func configure(_ model: RepoInfoModel?) {
        guard let model = model else { return }
        headerLabel.text = model.key ?? ""
        descpLabel.text = model.value ?? ""
    }
    
}
