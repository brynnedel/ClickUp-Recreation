//
//  DoneView.swift
//  academy-final
//
//  Created by Brynne Delaney on 4/18/23.
//

import SwiftUI

struct DoneView: View {
    @ObservedObject var tasks: Tasks
    
    var body: some View {
        VStack (alignment: .leading){
            Text("Done")
            ForEach (tasks.items) { task in
                if (task.isDone) {
                    ToDoItem(vm: TaskViewModel(task: task), tasks: tasks)
                }
            }
        }
    }
}

struct DoneView_Previews: PreviewProvider {
    static var previews: some View {
        DoneView(tasks: .example)
    }
}
