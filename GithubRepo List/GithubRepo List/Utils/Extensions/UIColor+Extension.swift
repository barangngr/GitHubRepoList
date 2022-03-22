//
//  UIColor+Extension.swift
//  GithubRepo List
//
//  Created by Baran Gungor on 19.03.2022.
//

import UIKit

extension UIColor {
    
    static let navColor = #colorLiteral(red: 0.09411764706, green: 0.1058823529, blue: 0.1294117647, alpha: 1)
    static let backColor = #colorLiteral(red: 0.007843137255, green: 0.01568627451, blue: 0.03529411765, alpha: 1)
    static let cellBackColor = #colorLiteral(red: 0.08235294118, green: 0.09019607843, blue: 0.1294117647, alpha: 1)
    
    static let headerColor = #colorLiteral(red: 0.7921568627, green: 0.8196078431, blue: 0.8470588235, alpha: 1)
    static let descpColor = #colorLiteral(red: 0.4862745098, green: 0.5098039216, blue: 0.5411764706, alpha: 1)
    
    static let rColor = randomColor()
    static let rColor2 = randomColor()
    static let rColor3 = randomColor()
    static let rColor4 = randomColor()
    static let rColor5 = randomColor()
        
    static func colorForID(_ id: Int?) -> UIColor {
        guard let id = id else { return .black }
    
        switch id % 5 {
        case 0: return rColor
        case 1: return rColor2
        case 2: return rColor3
        case 3: return rColor4
        case 4: return rColor5
        default: return .black
        }
        
    }
    
    static func randomColor() -> UIColor {
        return UIColor(red: .random(in: 0...1),
                       green: .random(in: 0...1),
                       blue: .random(in: 0...1),
                       alpha: 1.0)
    }
    
}
