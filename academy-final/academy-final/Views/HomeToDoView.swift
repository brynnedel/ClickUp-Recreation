//
//  HomeToDoView.swift
//  academy-final
//
//  Created by Brynne Delaney on 4/17/23.
//

import SwiftUI

struct HomeToDoView: View {
    @State var showText = false
    @ObservedObject var tasks: Tasks
    @State private var showAddTask = false
    var category: String
    @State private var count = 0

    var body: some View {
        let myCalendar = Calendar(identifier: .gregorian)
        let ymd = myCalendar.dateComponents([.year, .month, .day], from: Date())
        VStack(alignment: .leading) {
            Button {
                self.showText.toggle()
            } label: {
                HStack {
                    Image(systemName: "chevron.right")
                        .foregroundColor(self.showText ? .purple : .gray)
                        .rotationEffect(.degrees(showText ? 90 : 0))
                    Text(category)
                    Spacer()
                    Button {
                        showAddTask = true
                    } label: {
                        Image(systemName: "plus")
                            .resizable()
                            .frame(width: 16, height: 16)
                    }
                    .buttonStyle(.plain)
                    Image(systemName: "chevron.up.chevron.down")
                        .resizable()
                        .frame(width: 12, height: 16)
                }
            }
            .buttonStyle(.plain)
            VStack {
                if self.showText && category == "Today" {
                    ForEach(tasks.items) { task in
                        let comp = myCalendar.dateComponents([.year, .month, .day], from: task.dueDate)
                        if ymd == comp && !task.isDone {
                            ToDoItem(vm: TaskViewModel(task: task), tasks: tasks)
                        }
                    }
                }
                if self.showText && category == "Overdue" {
                    ForEach(tasks.items) { task in
                        let comp = myCalendar.dateComponents([.year, .month, .day], from: task.dueDate)
                        if comp != ymd && task.dueDate < Date.now && !task.isDone {
                            ToDoItem(vm: TaskViewModel(task: task), tasks: tasks)
                        }
                    }
                }
                if self.showText && category == "Next" {
                    ForEach(tasks.items) { task in
                        if task.dueDate > Date.now && !task.isDone {
                            ToDoItem(vm: TaskViewModel(task: task), tasks: tasks)
                        }
                    }
                }
            }
            .sheet(isPresented: $showAddTask) {
                AddTask(tasks: tasks)
            }
        }
    }
}

struct HomeToDoView_Previews: PreviewProvider {
    static var previews: some View {
        HomeToDoView(tasks: .example, category: "Today")
    }
}
