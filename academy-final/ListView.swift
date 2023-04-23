//
//  ListView.swift
//  academy-final
//
//  Created by Brynne Delaney on 4/23/23.
//

import SwiftUI

struct ListView: View {
    @ObservedObject var tasks: Tasks
    @ObservedObject var lists: Lists
    @State private var isSideOpen = false
    
    
    var body: some View {
        ZStack {
            VStack {
                HStack (alignment: .top){
                    Button {
                        isSideOpen.toggle()
                    } label: {
                        Image(systemName: "line.3.horizontal")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .padding()
                    }
                    .buttonStyle(.plain)
                    .padding(.trailing, 50)
                    HStack {
                        Image(systemName: "building.columns")
                            .resizable()
                            .frame(width: 15, height: 15)
                            .padding(8)
                            .foregroundColor(.white)
                            .background(.orange)
                            .cornerRadius(10)
                        Text("Spring 2023")
                    }
                    .padding(10)
                    Spacer()
                }
                VStack {
                    ForEach (lists.spaces) { list in
                        SingleListView(list: ListViewModel(list: list))
                    }
                }
                Spacer()
            }
            Sidebar(isSidebarVisible: $isSideOpen, tasks: tasks, lists: lists)
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(tasks: .example, lists: .example)
    }
}
