//
//  HomeToDoView.swift
//  academy-final
//
//  Created by Brynne Delaney on 4/17/23.
//

import SwiftUI

struct HomeToDoView: View {
    @State var showText = false
    @StateObject private var tasks = Tasks.example
    @State private var showAddTask = false
    var category: String
    
    func removeItems(at offsets: IndexSet) {
        tasks.items.remove(atOffsets: offsets)
    }
    
//    var filteredTasks: Tasks {
//        switch category {
//        case "Today":
//            ForEach(tasks.items, id: \.self) { item in
//                if (item.dueDate != Date.now) {
//                    removeItems(at: offsets)
//                }
//            }
//            return tasks
//        case "Overdue":
//            ForEach(tasks.items, id: \.self) { item in
//                if (item.dueDate )
//            }
//        }
//    }
    
    var body: some View {
        VStack (alignment: .leading){
            Button {
                self.showText.toggle()
            } label: {
                HStack {
                    Image(systemName: "chevron.right")
                        .rotationEffect(.degrees(showText ? 90 : 0))
                    Text(category)
                    Text("(2)")
                        .foregroundColor(.gray)
                    Spacer()
                    Button {
                        showAddTask = true
                    }label: {
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
                if (self.showText) {
                    ForEach(tasks.items) { task in
                        rectangle
                        ToDoItem(task: task)
                    }
                }
            }
            .sheet(isPresented: $showAddTask) {
                AddTask(tasks: tasks)
            }
        }
    }
    
    var rectangle: some View {
        Rectangle()
            .frame(height: 1)
            .foregroundColor(.gray)
            .padding(.all, 4)
    }
}


struct HomeToDoView_Previews: PreviewProvider {
    static var previews: some View {
        HomeToDoView(category: "Today")
    }
}
