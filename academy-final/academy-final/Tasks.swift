//
//  Tasks.swift
//  academy-final
//
//  Created by Brynne Delaney on 4/18/23.
//

import Foundation

class Tasks: ObservableObject {
    @Published var items = [TaskItem]()
}

extension Tasks {
    static var example: Tasks {
        let tasks = Tasks()
        tasks.items.append(TaskItem.example)
        tasks.items.append(TaskItem.example1)
        return tasks
    }
}
