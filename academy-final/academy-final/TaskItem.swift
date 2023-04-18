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
}

extension TaskItem {
    static var example: TaskItem {
        TaskItem(taskName: "Week 14 reading", isDone: true, dueDate: Date.now)
    }
    static var example1: TaskItem {
        TaskItem(taskName: "Assignment 1", isDone: false, dueDate: Date.now)
    }
}
