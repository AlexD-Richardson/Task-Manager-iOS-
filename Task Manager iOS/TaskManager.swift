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
    
    var incompletedTaskArray: [Task] = [Task(taskName: "Collect Money", taskPriority: .Average, description: "Damn you Leopold Strauss"), Task(taskName: "Find Dutch a cigar", taskPriority: .Low, description: "I can't find no damn cigar"), Task(taskName: "Make Money", taskPriority: .High, description: "Rob and Steal")]
    
    var completedTaskArray: [Task] = [Task(taskName: "Go fishing with Jack", taskPriority: .Average, description: "Catch fish with the boah"), Task(taskName: "Rob a train with John", taskPriority: .High, description: "Get them oil wagons"), Task(taskName: "Steal sheep with John", taskPriority: .Low, description: "Damn sheep")]
    
    
    
    
}
