//
//  CommentView.swift
//  academy-final
//
//  Created by Brynne Delaney on 4/18/23.
//

import SwiftUI

struct CommentView: View {
    var body: some View {
        VStack (spacing: 8){
            Image(systemName: "person.crop.circle")
                .resizable()
                .frame(width: 75, height: 75)
                .foregroundColor(.gray)
                .padding()
            Text("No Assigned Comments")
                .font(.body)
                .foregroundColor(.gray)
            Text("All your assigned comments will appear here!")
                .font(.footnote)
                .foregroundColor(.gray)
        }
    }
}

struct CommentView_Previews: PreviewProvider {
    static var previews: some View {
        CommentView()
    }
}
