//
//  TaskManager.swift
//  Task Manager iOS
//
//  Created by Alex Richardson on 11/1/18.
//  Copyright © 2018 Alex Richardson. All rights reserved.
//

import Foundation


class TaskManager {
    
    static let sharedInstance = TaskManager()
    
    private init() { }
    
    var incompletedTaskArray: [Task] = []
        
    
    
    var completedTaskArray: [Task] = []
        
    
    
    
    func getIncompleteTask(at index: Int) -> Task {
        
        return incompletedTaskArray[index]
        
    }
    
    func getCompletedTask(at index: Int) -> Task {
        
        return completedTaskArray[index]
        
    }
    
    
}
