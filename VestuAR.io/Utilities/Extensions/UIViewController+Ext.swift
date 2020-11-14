//
//  UIViewController+Ext.swift
//  VestuAR.io
//
//  Created by Jerry Turcios on 11/14/20.
//

import UIKit

extension UIViewController {
    // Presents a generic alert; useful for basic errors
    func presentGenericAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default))
        present(alert, animated: true)
    }
}
