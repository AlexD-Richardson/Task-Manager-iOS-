//
//  EditTaskViewController.swift
//  Task Manager iOS
//
//  Created by Alex Richardson on 11/5/18.
//  Copyright © 2018 Alex Richardson. All rights reserved.
//

import UIKit

class EditTaskViewController: UIViewController {
    
    @IBOutlet weak var taskNameTextField: UITextField!
    
    @IBOutlet weak var taskDescriptionTextField: UITextField!
    
    @IBOutlet weak var priorityChooser: UISegmentedControl!
    
    @IBOutlet weak var dueDatePicker: UIDatePicker!
    
    
    var taskToEdit: Task!

    override func viewDidLoad() {
        super.viewDidLoad()

        taskNameTextField.text = taskToEdit.taskName
        
        taskDescriptionTextField.text = taskToEdit.description
        
        switch taskToEdit.taskPriority {
            
        case .Low: priorityChooser.selectedSegmentIndex = 0
            
        case .Average: priorityChooser.selectedSegmentIndex = 1
            
        case .High: priorityChooser.selectedSegmentIndex = 2
            
        default: priorityChooser.selectedSegmentIndex = 1
            
        }
        
        let currentCalendar = Calendar.current
        
        dueDatePicker.minimumDate = Date()
        
        dueDatePicker.maximumDate = currentCalendar.date(byAdding: .year, value: 1 , to: Date())
        
        dueDatePicker.date = formatDateFromString(taskToEdit.dueDate)
        
    }
        
    @IBAction func submitButtonTapped(_ sender: Any) {
        
        guard let editedTaskName = taskNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) else {
            
            return
            
        }
        
        guard let editedTaskDescription = taskDescriptionTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) else {
            
            return
            
        }
        
        if editedTaskName.isEmpty || editedTaskDescription.isEmpty {
            
            return showErrorAlert(self, "Empty Fields", "Please enter in a value for all fields", "Close")
            
        }
        
        let editedTaskPriority = priorityChooser.selectedSegmentIndex
        
        let editedDueDate = dueDatePicker.date
        
        
        let editedTask = Task(taskName: editedTaskName, taskPriority: Task.Priority.init(rawValue: editedTaskPriority)!, description: editedTaskDescription)
        
        let formattedDate = formatDate(editedDueDate)
        
        editedTask.dueDate = formattedDate
        
        if taskToEdit.completionStatus == false {
            
            TaskManager.sharedInstance.incompletedTaskArray.append(editedTask)
            
        } else {
            
            TaskManager.sharedInstance.completedTaskArray.append(editedTask)
            
        }
        
        
        
        self.performSegue(withIdentifier: "unwindToListOfTasks", sender: self)
        
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
