//
//  ListOfTasksViewController.swift
//  Task Manager iOS
//
//  Created by Alex Richardson on 10/30/18.
//  Copyright © 2018 Alex Richardson. All rights reserved.
//

import UIKit

class ListOfTasksViewController: UIViewController {
    
    
    @IBOutlet weak var filterSwitch: UISwitch!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        filterSwitch.backgroundColor = UIColor.red
        
        filterSwitch.tintColor = UIColor.red
        
        filterSwitch.onTintColor = UIColor.green
        
        filterSwitch.layer.cornerRadius = 16
        

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ListOfTasksViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Task Cell") as! TaskTableViewCell
        
        return cell
        
    }
    
    
    
    
}
