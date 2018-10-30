//
//  Alerts.swift
//  Task Manager iOS
//
//  Created by Alex Richardson on 10/30/18.
//  Copyright © 2018 Alex Richardson. All rights reserved.
//

import Foundation
import UIKit

func showErrorAlert(_ viewController: UIViewController, _ name: String, _ msg: String, _ dismiss: String) {
    
    let errorAlert = UIAlertController(title: name, message: msg, preferredStyle: .actionSheet)
    
    let dismissAction = UIAlertAction(title: dismiss, style: .default, handler: nil)
    
    errorAlert.addAction(dismissAction)
    
    viewController.present(errorAlert, animated: true, completion: nil)
    
}
