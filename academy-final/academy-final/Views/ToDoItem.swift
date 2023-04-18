//
//  ToDoItem.swift
//  academy-final
//
//  Created by Brynne Delaney on 4/17/23.
//

import SwiftUI

struct ToDoItem: View {
    @State var task: TaskItem
    var body: some View {
        HStack {
            if (task.isDone) {
                Image(systemName: "square.fill")
                    .foregroundColor(.green)
            } else {
                Image(systemName: "square.fill")
                    .foregroundColor(.gray)
            }
            Text(task.taskName)
                .foregroundColor(.gray)
            Spacer()
            Text(task.dueDate, format: .dateTime.day().month().year())
                .foregroundColor(.gray)
        }
    }
}

struct ToDoItem_Previews: PreviewProvider {
    static var previews: some View {
        ToDoItem(task: TaskItem.example)
    }
}
