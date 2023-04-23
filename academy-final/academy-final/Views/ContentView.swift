//
//  ContentView.swift
//  academy-final
//
//  Created by Brynne Delaney on 4/17/23.
//

import SwiftUI

struct ContentView: View {
    @State private var showToDo = true
    @State private var showComm = false
    @State private var showDone = false
    @State private var isSideOpen = false
    @ObservedObject var tasks = Tasks()
    @State private var showAddTask = false
    var categories = ["Today", "Overdue", "Next"]
    
    
    var body: some View {
        ZStack {
            NavigationStack {
                HStack (alignment: .top){
                    Button {
                        isSideOpen.toggle()
                    } label: {
                        Image(systemName: "line.3.horizontal")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .padding(.trailing)
                    }
                    .buttonStyle(.plain)
                    Spacer()
                    Text("Home")
                        .font(.title)
                    Spacer()
                    Image(systemName: "bell")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .padding(.horizontal, 4)
                    Image(systemName: "gearshape")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .padding(.horizontal, 4)
                }
                .padding()
                VStack {
                    HStack(alignment: .top, spacing: 60) {
                        Button {
                            self.showToDo = true
                            self.showComm = false
                            self.showDone = false
                        } label: {
                            if (self.showToDo) {
                                Text("**To Do**")
                                    .foregroundColor(.purple)
                            } else {
                                Text("To Do")
                            }
                        }
                        .buttonStyle(.plain)
                        Button {
                            self.showToDo = false
                            self.showComm = true
                            self.showDone = false
                        } label: {
                            if (self.showComm) {
                                Text("**Comments**")
                                    .foregroundColor(.purple)
                            } else {
                                Text("Comments")
                            }
                        }
                        .buttonStyle(.plain)
                        Button {
                            self.showToDo = false
                            self.showComm = false
                            self.showDone = true
                        } label: {
                            if (self.showDone) {
                                Text("**Done**")
                                    .foregroundColor(.purple)
                            } else {
                                Text("Done")
                            }
                        }
                        .buttonStyle(.plain)
                    }
                    .padding()
                }
                List {
                    if (self.showToDo) {
                        ForEach(categories, id: \.self) {category in
                            HomeToDoView(tasks: tasks, category: category)
                        }
                    }
                    if (self.showComm) {
                        CommentView()
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                    if (self.showDone) {
                        DoneView(tasks: tasks)
                    }
                }
            }
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button {
                        showAddTask.toggle()
                    } label: {
                        Image(systemName: "plus")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.white)
                            .padding(10)
                            .background(.purple)
                            .cornerRadius(10)
                    }
                }
                .padding()
            }
            .sheet(isPresented: $showAddTask) {
                AddTask(tasks: tasks)
            }
            Sidebar(isSidebarVisible: $isSideOpen, tasks: tasks)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
