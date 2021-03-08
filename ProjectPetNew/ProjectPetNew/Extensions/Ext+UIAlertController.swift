//
//  Ext+UIAlertController.swift
//  ProjectPetNew
//
//  Created by Ting Becker on 3/8/21.
//

import UIKit

extension UIAlertController {
    
    static func showAlert(title: String?, message: String?, actionTitle: String?) -> UIAlertController {
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: actionTitle, style: .default))
        return ac
    }
    
}
