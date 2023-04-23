//
//  AddTask.swift
//  academy-final
//
//  Created by Brynne Delaney on 4/18/23.
//

import SwiftUI

struct AddTask: View {
    @State private var name = ""
    @State private var date = Date()
    @State private var showDatePick = false
    @State private var isDone = false
    @State private var info = ""
    @ObservedObject var tasks: Tasks
    @Environment(\.dismiss) var dismiss
    @FocusState private var keyboardFocused: Bool
    
    var body: some View {
        NavigationStack {
            TextField("Task Name", text: $name)
                .padding(.leading)
                .font(.title2)
                .focused($keyboardFocused)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        keyboardFocused = true
                    }
                }
            rectangle
            Button {
                self.isDone.toggle()
            } label: {
                if (self.isDone) {
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
            } label: {
                HStack {
                    Image(systemName: "calendar.badge.plus")
                        .foregroundColor(.gray)
                    Text(date, format: .dateTime.day().month().year())                        .foregroundColor(.gray)
                    Spacer()
                }
                .padding(.horizontal, 30)
            }
            .buttonStyle(.plain)
            if (showDatePick) {
                AddDate(date: $date)
            }
            rectangle
            TextField("Add info", text: $info)
                .padding(.leading)
                .font(.title2)
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
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                    }
                    .buttonStyle(.plain)
                }
                ToolbarItem(placement: .bottomBar) {
                    Button("Create") {
                        let task = TaskItem(taskName: name, isDone: self.isDone, dueDate: date, info: info)
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

struct AddDate: View {
    @Binding var date: Date
    var body: some View {
        DatePicker("Due Date", selection: $date)
            .datePickerStyle(.graphical)
    }
}

struct AddTask_Previews: PreviewProvider {
    static var previews: some View {
        AddTask(tasks: .example)
    }
}
