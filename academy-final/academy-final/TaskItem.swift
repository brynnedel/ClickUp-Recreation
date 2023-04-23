//
//  TaskItem.swift
//  academy-final
//
//  Created by Brynne Delaney on 4/18/23.
//

import Foundation

struct TaskItem: Identifiable {
     var id = UUID()
     var taskName: String
     var isDone: Bool
     var dueDate: Date
    var info: String
    
    mutating func toggleDone(){
        self.isDone = !self.isDone
    }
    
    mutating func changeDate(date: Date) {
        self.dueDate = date
    }
    
    mutating func changeName(name: String) {
        self.taskName = name
    }
}

extension TaskItem {
    static var example: TaskItem {
        TaskItem(taskName: "Week 14 reading", isDone: true, dueDate: Date.now, info: "ANTH 231")
    }
    static var example1: TaskItem {
        TaskItem(taskName: "Assignment 1", isDone: false, dueDate: Date.now, info: "COMP 211")
    }
}
