//
//  UserDetailTableHeaderView.swift
//  GithubRepo List
//
//  Created by Baran Gungor on 21.03.2022.
//

import UIKit

final class UserDetailTableHeaderView: UIView {
    
    // MARK: Properties
    private let containerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 20
        view.backgroundColor = .cellBackColor
        return view
    }()
    
    private let imageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        view.isUserInteractionEnabled = true
        return view
    }()
    
    let headerLabel: UILabel = {
        let label = UILabel()
        label.textColor = .headerColor
        label.textAlignment = .center
        label.font = UIFont(name: "Roboto-Bold", size: 15)
        return label
    }()
    
    let descpNameLabel = DescpLabel()
    let descpLocationLabel = DescpLabel()
    let descpCompanyLabel = DescpLabel()
    let descpFollowersLabel = DescpLabel()
    
    // MARK: Initiliaze
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    // MARK: Functions
    func commonInit() {
        backgroundColor = .clear
        
        addSubview(views: containerView)
        containerView.fill(.all, constant: 10)
        
        containerView.addSubview(views: imageView, descpNameLabel, descpLocationLabel, descpCompanyLabel, descpFollowersLabel)
        imageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10).isActive = true
        imageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        descpNameLabel.fill(.horizontal, constant: 5)
        descpNameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 15).isActive = true
        
        descpLocationLabel.fill(.horizontal, constant: 5)
        descpLocationLabel.topAnchor.constraint(equalTo: descpNameLabel.bottomAnchor, constant: 5).isActive = true
        
        descpCompanyLabel.fill(.horizontal, constant: 5)
        descpCompanyLabel.topAnchor.constraint(equalTo: descpLocationLabel.bottomAnchor, constant: 5).isActive = true
        
        descpFollowersLabel.fill(.horizontal, constant: 5)
        descpFollowersLabel.topAnchor.constraint(equalTo: descpCompanyLabel.bottomAnchor, constant: 5).isActive = true
        descpFollowersLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -15).isActive = true
    }
    
    func configure(_ data: UserDetailResponseModel?) {
        guard let data = data, let avatarURL = data.avatarUrl else { return }
        imageView.loadImageUsingCache(withUrl: avatarURL)
        descpNameLabel.text = data.name
        descpLocationLabel.text = data.location
        descpCompanyLabel.text = data.company
        descpFollowersLabel.text = "Followers: \(data.followers ?? 0)   Following: \(data.following ?? 0)"
    }
    
}
