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
    
    @IBOutlet weak var taskTableView: UITableView!
    
    @IBOutlet weak var totalTasks: UILabel!
    
    @IBOutlet weak var completeTasks: UILabel!
    
    @IBOutlet weak var incompleteTasks: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        filterSwitch.backgroundColor = UIColor.red
        
        filterSwitch.tintColor = UIColor.red
        
        filterSwitch.onTintColor = UIColor.green
        
        filterSwitch.layer.cornerRadius = 16
        
        totalTasks.text = "Total: \(TaskManager.sharedInstance.completedTaskArray.count + TaskManager.sharedInstance.incompletedTaskArray.count)"
        
        completeTasks.text = "Complete: \(TaskManager.sharedInstance.completedTaskArray.count)"
        
        incompleteTasks.text = "Incomplete: \(TaskManager.sharedInstance.incompletedTaskArray.count)"
        
       
    }
    
    @IBAction func filterSwitchFlipped(_ sender: Any) {
        
      taskTableView.reloadData()
        
    }

}

extension ListOfTasksViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if filterSwitch.isOn {
            
             return TaskManager.sharedInstance.completedTaskArray.count
            
        } else {
            
            return TaskManager.sharedInstance.incompletedTaskArray.count
            
        }
        
       
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Task Cell") as! TaskTableViewCell
        
        if filterSwitch.isOn {
            
             cell.taskImage.image = UIImage(named: "Checkmark")
            
            cell.titleLabel.text = TaskManager.sharedInstance.completedTaskArray[indexPath.row].taskName
            
            if TaskManager.sharedInstance.completedTaskArray[indexPath.row].taskPriority.rawValue == 1 {
                
                cell.priorityLabel.text = "Low"
                
            } else if TaskManager.sharedInstance.completedTaskArray[indexPath.row].taskPriority.rawValue == 2 {
                
                cell.priorityLabel.text = "Average"
                
            } else {
                
                cell.priorityLabel.text = "High"
                
            }
            
            if TaskManager.sharedInstance.completedTaskArray[indexPath.row].dueDate != nil {
                
                cell.dueDateLabel.isHidden = false
                
                cell.dueDateLabel.text = ""
                
            }
            
        } else {
            
            cell.taskImage.image = UIImage(named: "xmark")
            
            cell.titleLabel.text = TaskManager.sharedInstance.incompletedTaskArray[indexPath.row].taskName
            
            if TaskManager.sharedInstance.incompletedTaskArray[indexPath.row].taskPriority.rawValue == 1 {
                
                cell.priorityLabel.text = "Low"
                
            } else if TaskManager.sharedInstance.incompletedTaskArray[indexPath.row].taskPriority.rawValue == 2 {
                
                cell.priorityLabel.text = "Average"
                
            } else {
                
                cell.priorityLabel.text = "High"
                
            }
            
        }
        
        return cell
        
    }
    
    
    
    
}
