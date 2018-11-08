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
    
    var currentTask: Task!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        filterSwitch.backgroundColor = UIColor.red
        
        filterSwitch.tintColor = UIColor.red
        
        filterSwitch.onTintColor = UIColor.green
        
        filterSwitch.layer.cornerRadius = 16
        
        totalTasks.text = "Total: \(TaskManager.sharedInstance.completedTaskArray.count + TaskManager.sharedInstance.incompletedTaskArray.count)"
        
        completeTasks.text = "Complete: \(TaskManager.sharedInstance.completedTaskArray.count)"
        
        incompleteTasks.text = "Incomplete: \(TaskManager.sharedInstance.incompletedTaskArray.count)"
        
        if TaskManager.sharedInstance.incompletedTaskArray.count == 0 && TaskManager.sharedInstance.completedTaskArray.count == 0 {
            
            showErrorAlert(self, "No Tasks", "There no tasks in the Task Manager.", "Close")
            
        } else {
        
        totalTasks.text = "Total: \(TaskManager.sharedInstance.completedTaskArray.count + TaskManager.sharedInstance.incompletedTaskArray.count)"
        
        completeTasks.text = "Complete: \(TaskManager.sharedInstance.completedTaskArray.count)"
        
        incompleteTasks.text = "Incomplete: \(TaskManager.sharedInstance.incompletedTaskArray.count)"
            
        }
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        viewDidLoad()
        
        taskTableView.reloadData()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destination = segue.destination as? EditTaskViewController {
            
            destination.taskToEdit = currentTask
            
        }
        
    }
    
    
    @IBAction func filterSwitchFlipped(_ sender: Any) {
        
        taskTableView.reloadData()
        
        totalTasks.text = "Total: \(TaskManager.sharedInstance.completedTaskArray.count + TaskManager.sharedInstance.incompletedTaskArray.count)"
        
        completeTasks.text = "Complete: \(TaskManager.sharedInstance.completedTaskArray.count)"
        
        incompleteTasks.text = "Incomplete: \(TaskManager.sharedInstance.incompletedTaskArray.count)"
        
    }
    
    @IBAction func unwindToListOfTasks(segue: UIStoryboardSegue) { }
    
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
            
            currentTask = TaskManager.sharedInstance.getCompletedTask(at: indexPath.row)
            
            cell.taskImage.image = UIImage(named: "Checkmark")
            
            cell.titleLabel.text = TaskManager.sharedInstance.completedTaskArray[indexPath.row].taskName
            
            if TaskManager.sharedInstance.completedTaskArray[indexPath.row].taskPriority.rawValue == 0 {
                
                cell.priorityLabel.text = "Low"
                
            } else if TaskManager.sharedInstance.completedTaskArray[indexPath.row].taskPriority.rawValue == 1 {
                
                cell.priorityLabel.text = "Average"
                
            } else {
                
                cell.priorityLabel.text = "High"
                
            }
            
                cell.dueDateLabel.text = TaskManager.sharedInstance.completedTaskArray[indexPath.row].dueDate
            
            
        } else {
            
            currentTask = TaskManager.sharedInstance.getIncompleteTask(at: indexPath.row)
            
            cell.taskImage.image = UIImage(named: "xmark")
            
            cell.titleLabel.text = TaskManager.sharedInstance.incompletedTaskArray[indexPath.row].taskName
            
            if TaskManager.sharedInstance.incompletedTaskArray[indexPath.row].taskPriority.rawValue == 0 {
                
                cell.priorityLabel.text = "Low"
                
            } else if TaskManager.sharedInstance.incompletedTaskArray[indexPath.row].taskPriority.rawValue == 1 {
                
                cell.priorityLabel.text = "Average"
                
            } else {
                
                cell.priorityLabel.text = "High"
                
            }
            
                cell.dueDateLabel.text = TaskManager.sharedInstance.incompletedTaskArray[indexPath.row].dueDate
            
            
        }
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete") { (_, _) in
            
            if self.filterSwitch.isOn {
                
                self.currentTask = TaskManager.sharedInstance.completedTaskArray[indexPath.row]
                
                TaskManager.sharedInstance.completedTaskArray.remove(at: indexPath.row)
                
            } else {
                
                self.currentTask = TaskManager.sharedInstance.incompletedTaskArray[indexPath.row]
                
                TaskManager.sharedInstance.incompletedTaskArray.remove(at: indexPath.row)
                
            }
            
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        }
        
        let title: String!
        
        if filterSwitch.isOn {
            
            title = "Mark Incomplete"
            
        } else {
            
            title = "Mark Complete"
            
        }
        
        let markAction = UITableViewRowAction(style: .normal, title: title) { (_, _) in
            
            if self.filterSwitch.isOn {
                
                self.currentTask = TaskManager.sharedInstance.getCompletedTask(at: indexPath.row)
                
                self.currentTask.completionStatus = false
            TaskManager.sharedInstance.incompletedTaskArray.append(TaskManager.sharedInstance.completedTaskArray.remove(at: indexPath.row))
                
                tableView.reloadData()
                
            } else {
                
                self.currentTask = TaskManager.sharedInstance.getIncompleteTask(at: indexPath.row)
                
                self.currentTask.completionStatus = true
                TaskManager.sharedInstance.completedTaskArray.append(TaskManager.sharedInstance.incompletedTaskArray.remove(at: indexPath.row))
                
                tableView.reloadData()
                
            }
            
        }
        
        let showEditScreenAction = UITableViewRowAction(style: .normal, title: "Edit") { (_, _) in
            
            if self.filterSwitch.isOn {
                
                self.currentTask = TaskManager.sharedInstance.getCompletedTask(at: indexPath.row)
                
                self.performSegue(withIdentifier: "ShowEditTaskScreen", sender: self)
                
                TaskManager.sharedInstance.completedTaskArray.remove(at: indexPath.row)
                
            } else {
                
                self.currentTask = TaskManager.sharedInstance.getIncompleteTask(at: indexPath.row)
                
        
                self.performSegue(withIdentifier: "ShowEditTaskScreen", sender: self)
                
                
                TaskManager.sharedInstance.incompletedTaskArray.remove(at: indexPath.row)
            }
            
            
        }
        
        showEditScreenAction.backgroundColor = UIColor.blue
        
        
        return [deleteAction, markAction, showEditScreenAction]
        
    }
    
    
    
    
    
}
