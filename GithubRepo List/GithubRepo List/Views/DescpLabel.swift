//
//  DescpLabel.swift
//  GithubRepo List
//
//  Created by Baran Gungor on 21.03.2022.
//

import UIKit

class DescpLabel: UILabel {

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
    private func commonInit() {
        textColor = .descpColor
        font = UIFont(name: "Roboto-Medium", size: 13)
        textAlignment = .center
        adjustsFontSizeToFitWidth = true
    }
    
}
