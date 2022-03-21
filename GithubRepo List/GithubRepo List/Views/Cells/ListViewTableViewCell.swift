//
//  ListViewTableViewCell.swift
//  GithubRepo List
//
//  Created by Baran Gungor on 19.03.2022.
//

import UIKit

final class ListViewTableViewCell: BaseTableViewCell {
    
    // MARK: Properties
    private let cellImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    // MARK: Functions
    override func commonInit() {
        super.commonInit()
        containerView.addSubview(views: cellImageView, headerLabel, descpLabel)
    
        cellImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 15).isActive = true
        cellImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10).isActive = true
        cellImageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10).isActive = true
        cellImageView.widthAnchor.constraint(equalTo: cellImageView.heightAnchor).isActive = true
        cellImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        headerLabel.topAnchor.constraint(equalTo: cellImageView.topAnchor, constant: 5).isActive = true
        headerLabel.leadingAnchor.constraint(equalTo: cellImageView.trailingAnchor, constant: 15).isActive = true
        headerLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10).isActive = true
        
        descpLabel.bottomAnchor.constraint(equalTo: cellImageView.bottomAnchor, constant: -5).isActive = true
        descpLabel.leadingAnchor.constraint(equalTo: cellImageView.trailingAnchor, constant: 15).isActive = true
        descpLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10).isActive = true
    }
    
    func configure(_ model: ListResponseModel) {
        headerLabel.text = model.name ?? "--"
        descpLabel.text = model.owner?.login ?? "--"
        if let avatarURL = model.owner?.avatarUrl {
            cellImageView.loadImageUsingCache(withUrl: avatarURL)
        }
    }
    
}
