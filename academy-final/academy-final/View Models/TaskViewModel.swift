//
//  TaskViewModel.swift
//  academy-final
//
//  Created by Brynne Delaney on 4/21/23.
//

import Foundation

class TaskViewModel: ObservableObject {
    @Published var task: TaskItem
    
    init(task: TaskItem) {
        self.task = task
    }
    
    var taskName: String {
        task.taskName
    }
    
    var isDone: Bool {
        task.isDone
    }
    
    var dueDate: Date {
        task.dueDate
    }
    
    func toggleDone(){
        task.toggleDone()
    }
    
    func changeDate(date: Date) {
        task.changeDate(date: date)
    }
    
}
