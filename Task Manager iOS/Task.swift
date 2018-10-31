//
//  Task.swift
//  Task Manager iOS
//
//  Created by Alex Richardson on 10/31/18.
//  Copyright © 2018 Alex Richardson. All rights reserved.
//

import Foundation

class Task {
    
    var taskName: String
    
    var taskPriority: Priority
    
    var completionStatus: Bool
    
    var description: String
    
    var dueDate: String?
    
    enum Priority: Int {
        
        case Low = 1
        
        case Average
        
        case High
        
    }
    
    init(taskName: String, taskPriority: Priority, description: String) {
        
        self.taskName = taskName
        
        self.taskPriority = taskPriority
        
        self.description = description
        
        self.completionStatus = false
        
        
        
    }
    
}
