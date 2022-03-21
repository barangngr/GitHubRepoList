//
//  UserDetailTableViewCell.swift
//  GithubRepo List
//
//  Created by Baran Gungor on 21.03.2022.
//

import UIKit

final class UserDetailTableViewCell: BaseTableViewCell {
    
    // MARK: Properties
    private let leftView: UIView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 2
        return view
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        leftView.backgroundColor = .random()
    }
    
    // MARK: Functions
    override func commonInit() {
        super.commonInit()
        containerView.addSubview(views: leftView, headerLabel, descpLabel)
    
        leftView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 15).isActive = true
        leftView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10).isActive = true
        leftView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10).isActive = true
        leftView.widthAnchor.constraint(equalToConstant: 5).isActive = true
        leftView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        headerLabel.topAnchor.constraint(equalTo: leftView.topAnchor, constant: 5).isActive = true
        headerLabel.leadingAnchor.constraint(equalTo: leftView.trailingAnchor, constant: 15).isActive = true
        headerLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10).isActive = true
        
        descpLabel.bottomAnchor.constraint(equalTo: leftView.bottomAnchor, constant: -5).isActive = true
        descpLabel.leadingAnchor.constraint(equalTo: leftView.trailingAnchor, constant: 15).isActive = true
        descpLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10).isActive = true
    }
    
    func configure(_ model: RepositoryDetailResponseModel?) {
        guard let model = model else { return }
        headerLabel.text = model.name ?? "--"
        descpLabel.text = model.language ?? "--"
    }
    
}
