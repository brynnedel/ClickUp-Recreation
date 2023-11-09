//
//  EditTaskView.swift
//  academy-final
//
//  Created by Brynne Delaney on 4/22/23.
//

import SwiftUI

struct EditTaskView: View {
    @ObservedObject var task: TaskViewModel
    @ObservedObject var tasks: Tasks
    @State private var isDone: Bool = false
    @State private var date = Date()
    @State private var info = ""
    @State private var showDatePick = false
    @Environment(\.dismiss) var dismiss
    @FocusState private var keyboardFocused: Bool
    
    var body: some View {
            NavigationStack {
                Text(task.taskName)
                    .padding(.leading)
                    .font(.title2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .focused($keyboardFocused)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                            keyboardFocused = true
                        }
                    }
                rectangle
                Button {
                    task.toggleDone()
                    isDone = task.isDone
                } label: {
                    if (task.isDone) {
                        Image(systemName: "square.filled.on.square")
                            .foregroundColor(.green)
                        Text("CLOSED")
                            .padding(6)
                            .background(Color.green)
                            .cornerRadius(10)
                        Spacer()
                    } else {
                        Image(systemName: "square.filled.on.square")
                            .foregroundColor(.gray)
                        Text("OPEN")
                            .padding(6)
                            .background(Color.gray)
                            .cornerRadius(10)
                        Spacer()
                    }
                }
                .buttonStyle(.plain)
                .padding(.horizontal, 30)
                rectangle
                Button {
                    self.showDatePick.toggle()
                    date = task.dueDate
                } label: {
                    HStack {
                        Image(systemName: "calendar.badge.plus")
                            .foregroundColor(.gray)
                        Text(task.dueDate, format: .dateTime.day().month().year())                        .foregroundColor(.gray)
                        Spacer()
                    }
                    .padding(.horizontal, 30)
                }
                .buttonStyle(.plain)
                if (showDatePick) {
                    AddDate(date: $date)
                }
                rectangle
                Text(task.task.info)
                    .padding(.leading)
                    .font(.title2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .focused($keyboardFocused)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                            keyboardFocused = true
                        }
                    }
                Spacer()
                .padding(.leading)
                .toolbar {
                    ToolbarItem(placement: .automatic) {
                        Button {
                            task.task.isEdit = false
                            dismiss()
                        } label: {
                            Image(systemName: "xmark")
                        }
                        .buttonStyle(.plain)
                    }
                    ToolbarItem(placement: .bottomBar) {
                        Button("Save") {
                            task.changeDate(date: date)
                            tasks.removeTask(task: task.task)
                            let task = TaskItem(taskName: task.taskName, isDone: task.isDone, dueDate: task.dueDate, info: task.task.info)
                            tasks.items.append(task)
                            dismiss()
                        }
                        .padding(8)
                        .buttonStyle(.plain)
                        .background(Color.gray)
                        .cornerRadius(10)
                    }
                }
    
            }
        }
    
    
        var rectangle: some View {
            Rectangle()
                .frame(height: 1)
                .foregroundColor(.gray)
                .padding(.all)
        }
    
}

struct EditTaskView_Previews: PreviewProvider {
    static var previews: some View {
        EditTaskView(task: TaskViewModel(task: .example), tasks: .example)
    }
}

