//
//  SingleListView.swift
//  academy-final
//
//  Created by Brynne Delaney on 4/23/23.
//

import SwiftUI

struct SingleListView: View {
    @ObservedObject var list: ListViewModel
    
    var body: some View {
        VStack {
            Text("**\(list.listName)**")
                .foregroundColor(.purple)
            ForEach (list.tasks.items) { task in
                ToDoItem(vm: TaskViewModel(task: task), tasks: list.tasks)
            }
        }
    }
}

struct SingleListView_Previews: PreviewProvider {
    static var previews: some View {
        SingleListView(list: ListViewModel(list: .example))
    }
}
