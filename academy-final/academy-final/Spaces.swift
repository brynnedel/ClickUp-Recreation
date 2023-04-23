//
//  Spaces.swift
//  academy-final
//
//  Created by Brynne Delaney on 4/23/23.
//

import Foundation

class Lists: ObservableObject {
    @Published var spaces = [ListItem]()
}

struct ListItem: Identifiable {
    var id = UUID()
    var listName: String
    var listTasks: Tasks
}

extension ListItem {
    static var example: ListItem {
        let list = ListItem(listName: "MATH 233", listTasks: .example)
        return list
    }
    static var example2: ListItem {
        let list = ListItem(listName: "COMP 301", listTasks: Tasks())
        return list
    }
}

extension Lists {
    static var example: Lists {
        let lists = Lists()
        lists.spaces.append(ListItem.example)
        lists.spaces.append(ListItem.example2)
        return lists
    }
}
