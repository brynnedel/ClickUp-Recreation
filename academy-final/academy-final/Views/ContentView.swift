//
//  ContentView.swift
//  academy-final
//
//  Created by Brynne Delaney on 4/17/23.
//

import SwiftUI

struct ContentView: View {
    @State var showToDo = true
    @State var showComm = false
    @State var showDone = false
    var categories = ["Today", "Overdue", "Next", "No due date"]
    
    
    var body: some View {
        ZStack {
            VStack {
                HStack (alignment: .top){
                    Image(systemName: "line.3.horizontal")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .padding(.trailing)
                    Spacer()
                    Text("Home")
                        .font(.title)
                    Spacer()
                    Image(systemName: "bell")
                        .resizable()
                        .frame(width: 24, height: 24)
                    Image(systemName: "gearshape")
                        .resizable()
                        .frame(width: 24, height: 24)
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
                            HomeToDoView(category: category)
                        }
                    }
                    if (self.showComm) {
                        CommentView()
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                    if (self.showDone) {
                        DoneView(tasks: Tasks.example)
                    }
                }
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
