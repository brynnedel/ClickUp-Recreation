//
//  TasksViewModel.swift
//  academy-final
//
//  Created by Brynne Delaney on 4/21/23.
//

import Foundation

class TasksViewModel: ObservableObject {
    @Published var tasks: Tasks
    
    init(tasks: Tasks) {
        self.tasks = tasks
    }
}
