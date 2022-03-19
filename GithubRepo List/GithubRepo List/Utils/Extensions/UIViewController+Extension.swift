//
//  UIViewController+Extension.swift
//  GithubRepo List
//
//  Created by Baran Gungor on 19.03.2022.
//

import UIKit

extension UIViewController {
    
    func showAlert(_ message: String, title: String = "Dikkat", okAction: ((UIAlertAction) -> Void)? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Tamam", style: .default, handler: okAction)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func setNavColors(_ backgroundColor: UIColor, textColor: UIColor) {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithDefaultBackground()
        appearance.backgroundColor = backgroundColor
        appearance.titleTextAttributes = [.foregroundColor: textColor]

        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
    }
    
    func setNavBackButton(_ text: String = "") {
        let backButton = UIBarButtonItem()
        backButton.title = text
        navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }
    
}

