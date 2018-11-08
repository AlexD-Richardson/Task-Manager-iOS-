//
//  FormatDates.swift
//  Task Manager iOS
//
//  Created by Alex Richardson on 11/2/18.
//  Copyright © 2018 Alex Richardson. All rights reserved.
//

import Foundation

func formatDate(_ date: Date) -> String {
    
    let dateFormatter = DateFormatter()
    
    //allows to set different default date styles
    //dateFormatter.dateStyle = .medium
    
    dateFormatter.dateFormat = "MMM d, yyyy"
    
    let formattedString = dateFormatter.string(from: date)
    
    return formattedString
    
}

func formatDateFromString(_ string: String) -> Date {
    
    let date = DateFormatter()
    
    date.dateFormat = "MMM d, yyyy"
    
    let formattedDate = date.date(from: string)
    
    return formattedDate!
    
}
