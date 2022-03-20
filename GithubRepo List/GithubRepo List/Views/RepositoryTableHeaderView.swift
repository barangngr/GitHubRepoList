//
//  RepositoryTableHeaderView.swift
//  GithubRepo List
//
//  Created by Baran Gungor on 20.03.2022.
//

import UIKit

protocol RepositoryTableHeaderViewDelegate: AnyObject {
    func didTapImage()
}

final class RepositoryTableHeaderView: UIView {
    
    // MARK: Properties
    private let imageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        view.isUserInteractionEnabled = true
        return view
    }()
    
    weak var delegate: RepositoryTableHeaderViewDelegate?
    
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
        backgroundColor = .cellBackColor
        
        addSubview(views: imageView)
        imageView.fill(.vertical, constant: 5)
        imageView.fill(.horizontal, constant: 5)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(imageTapAction))
        imageView.addGestureRecognizer(tap)
    }
    
    func configure(_ imageURL: String?) {
        guard let imageURL = imageURL else {
            imageView.image = UIImage(named: "githubIcon")
            return
        }
        imageView.loadImageUsingCache(withUrl: imageURL)
    }
    
    // MARK: Action
    @objc func imageTapAction() {
        delegate?.didTapImage()
    }
    
}
