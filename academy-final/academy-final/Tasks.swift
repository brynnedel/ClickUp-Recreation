//
//  Tasks.swift
//  academy-final
//
//  Created by Brynne Delaney on 4/18/23.
//

import Foundation

class Tasks: ObservableObject {
    @Published var items = [TaskItem.example, TaskItem.example1]
    
    func removeTask(task: TaskItem) {
            items.removeAll { $0.id == task.id }
        }

}

extension Tasks {
    static var example: Tasks {
        let tasks = Tasks()
        tasks.items.append(TaskItem.example)
        tasks.items.append(TaskItem.example1)
        return tasks
    }
}
