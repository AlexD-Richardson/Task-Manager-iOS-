//
//  AddTaskViewController.swift
//  Task Manager iOS
//
//  Created by Alex Richardson on 11/2/18.
//  Copyright © 2018 Alex Richardson. All rights reserved.
//

import UIKit

class AddTaskViewController: UIViewController {
    
    
    @IBOutlet weak var taskNameTextField: UITextField!
    
    @IBOutlet weak var taskDescriptionTextField: UITextField!
    
    @IBOutlet weak var prioritySelector: UISegmentedControl!
    
    @IBOutlet weak var dueDatePicker: UIDatePicker!

    @IBOutlet weak var submitButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let currentCalendar = Calendar.current

        dueDatePicker.minimumDate = Date()
        
        dueDatePicker.maximumDate = currentCalendar.date(byAdding: .year, value: 1 , to: Date())
        
    }
    
    @IBAction func submitButtonTapped(_ sender: Any) {
        
        guard let newTaskName = taskNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) else {
            
            return
            
        }
        
        guard let newTaskDescription = taskDescriptionTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) else {
            
            return
            
        }
        
        if newTaskName.isEmpty || newTaskDescription.isEmpty {
            
            return showErrorAlert(self, "Empty Fields", "Please enter in a value for all fields", "Close")
            
        }
        
        var newTaskPriority = Task.Priority.init(rawValue: 0)
        
        if prioritySelector.selectedSegmentIndex == 0 {
            
            newTaskPriority = .Low
            
        } else if prioritySelector.selectedSegmentIndex == 1 {
            
            newTaskPriority = .Average
            
        } else {
            
            newTaskPriority = .High
            
        }
        
        let newDueDate = dueDatePicker.date
        
        let newTask = Task(taskName: newTaskName, taskPriority: Task.Priority.init(rawValue: newTaskPriority!.rawValue)!, description: newTaskDescription)
        
        let formattedDate = formatDate(newDueDate)
        
        newTask.dueDate = formattedDate
        
        TaskManager.sharedInstance.incompletedTaskArray.append(newTask)
        
        self.performSegue(withIdentifier: "unwindToListOfTasks", sender: self)
        
    }
    

}
