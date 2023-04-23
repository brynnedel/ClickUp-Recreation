//
//  ToDoItem.swift
//  academy-final
//
//  Created by Brynne Delaney on 4/17/23.
//

import SwiftUI

struct ToDoItem: View {
    @ObservedObject var vm: TaskViewModel
    @State private var showEdit: Bool = false
    @ObservedObject var tasks: Tasks
        
    var body: some View {
        Button {
            self.showEdit.toggle()
        } label: {
            VStack {
                rectangle
                HStack {
                    Image(systemName: "square.fill")
                        .foregroundColor(vm.isDone ? .green : .gray)
                    
                    Text(vm.taskName)
                        .foregroundColor(.gray)
                    Spacer()
                    Text(vm.dueDate, format: .dateTime.day().month().year())
                        .foregroundColor(.gray)
                }
            }
        }
        .sheet(isPresented: $showEdit) {
            EditTaskView(task: vm, tasks: tasks)
        }
    }
    var rectangle: some View {
        Rectangle()
            .frame(height: 1)
            .foregroundColor(.gray)
            .padding(.all, 4)
    }
}

struct ToDoItem_Previews: PreviewProvider {
    static var previews: some View {
        ToDoItem(vm: TaskViewModel(task: .example1), tasks: .example)
    }
}
