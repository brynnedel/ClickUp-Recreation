//
//  ListViewModel.swift
//  academy-final
//
//  Created by Brynne Delaney on 4/23/23.
//

import Foundation

class ListViewModel: ObservableObject {
    @Published var list: ListItem
    
    init(list: ListItem) {
        self.list = list
    }
    
    var listName: String {
        list.listName
    }
    
    var tasks: Tasks {
        list.listTasks
    }
}
