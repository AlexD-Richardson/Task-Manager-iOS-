//
//  PasswordViewController.swift
//  Task Manager iOS
//
//  Created by Alex Richardson on 10/30/18.
//  Copyright © 2018 Alex Richardson. All rights reserved.
//

import UIKit

class PasswordViewController: UIViewController {

    @IBOutlet weak var passwordTextField: UITextField!
    
    let password = "Hi"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Log Out", style: .plain, target: nil, action: nil)
        
    }

    @IBAction func submitButtonTapped(_ sender: Any) {
        
        guard let userinput = passwordTextField.text, !userinput.isEmpty else {
            
            return showErrorAlert(self, "Invalid Password", "Please enter in the password", "Close")
            
        }
        
        if passwordTextField.text == password {
            
            passwordTextField.text = ""
            
            self.performSegue(withIdentifier: "ShowListOfTasksSegue", sender: self)
            
        } else {
            
            showErrorAlert(self, "Invalid Password", "Please enter in the correct password", "Close")
            
        }
        
    }
    
}

