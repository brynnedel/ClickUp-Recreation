//
//  DoneView.swift
//  academy-final
//
//  Created by Brynne Delaney on 4/18/23.
//

import SwiftUI

struct DoneView: View {
    @StateObject var tasks: Tasks

    var body: some View {
        VStack (alignment: .leading){
            Text("Done")
            ForEach(tasks.items) { item in
                if (item.isDone) {
                    rectangle
                    ToDoItem(task: item)
                }
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

struct DoneView_Previews: PreviewProvider {
    static var previews: some View {
        DoneView(tasks: Tasks.example)
    }
}
