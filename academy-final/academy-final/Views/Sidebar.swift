//
//  Sidebar.swift
//  academy-final
//
//  Created by Brynne Delaney on 4/22/23.
//

import SwiftUI

struct Sidebar: View {
    @Binding var isSidebarVisible: Bool
    var sideBarWidth = UIScreen.main.bounds.size.width * 0.7
    @State var showFavs = false
    @State var showSpace = false
    @State var showDash = false
    @State var showDocs = false
    @State var showLists = false
    @ObservedObject var tasks: Tasks
    
    var body: some View {
        ZStack {
            GeometryReader { _ in
                EmptyView()
            }
            .background(.black.opacity(0.6))
            .opacity(isSidebarVisible ? 1 : 0)
            .animation(.easeInOut.delay(0.2), value: isSidebarVisible)
            .onTapGesture {
                isSidebarVisible.toggle()
            }
            content
        }
        .edgesIgnoringSafeArea(.all)
    }
    
    var content: some View {
        HStack (alignment: .top) {
            ZStack(alignment: .top) {
                Color.white
                
                VStack(alignment: .leading, spacing: 25){
                    userProfile
                    Button {
                        isSidebarVisible.toggle()
                    } label: {
                        HStack {
                            Image(systemName: "house")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .foregroundColor(.gray)
                            Text("Home")
                        }
                    }
                    .buttonStyle(.plain)
                    HStack {
                        Image(systemName: "bell")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.gray)
                        Text("Notifications")
                    }
                    Button {
                        showFavs.toggle()
                    } label: {
                        HStack {
                            Text("Favorites")
                            Spacer()
                            Image(systemName: "chevron.right")
                                .rotationEffect(.degrees(showFavs ? 90 : 0))
                        }
                    }
                    .buttonStyle(.plain)
                    if (showFavs) {
                        HStack {
                            Image(systemName: "tablecells")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .foregroundColor(.gray)
                            Text("Table")
                        }
                    }
                    Button {
                        showSpace.toggle()
                    } label: {
                        HStack {
                            Text("Spaces")
                            Spacer()
                            if (showSpace) {
                                Image(systemName: "plus")
                                    .resizable()
                                    .frame(width: 16, height: 16)
                                    .foregroundColor(.purple)
                            }
                            Image(systemName: "chevron.right")
                                .rotationEffect(.degrees(showSpace ? 90 : 0))
                        }
                    }
                    .buttonStyle(.plain)
                    if (showSpace) {
                        VStack {
                            HStack {
                                Image(systemName: "circle.grid.2x2")
                                    .resizable()
                                    .frame(width: 15, height: 15)
                                    .padding(4)
                                    .foregroundColor(.gray)
                                Text("Everything")
                                Spacer()
                            }
                            Button {
                                isSidebarVisible.toggle()
                            } label: {
                                Image(systemName: "building.columns")
                                    .resizable()
                                    .frame(width: 15, height: 15)
                                    .padding(8)
                                    .foregroundColor(.white)
                                    .background(.orange)
                                    .cornerRadius(10)
                                Text("Spring 2023")
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .rotationEffect(.degrees(showLists ? 90 : 0))
                            }
                            .buttonStyle(.plain)
                        }
                    }
                    
                    Button {
                        showDash.toggle()
                    } label: {
                        HStack {
                            Text("Dashboards")
                            Spacer()
                            Image(systemName: "chevron.right")
                                .rotationEffect(.degrees(showDash ? 90 : 0))
                        }
                    }
                    .buttonStyle(.plain)
                    if (showDash) {
                        Text("You don't have any Dashboards!")
                            .foregroundColor(.gray)
                    }
                    Button {
                        showDocs.toggle()
                    } label: {
                        HStack {
                            Text("Docs")
                            Spacer()
                            Image(systemName: "chevron.right")
                                .rotationEffect(.degrees(showDocs ? 90 : 0))
                        }
                    }
                    .buttonStyle(.plain)
                }
                .padding(.top, 80)
                .padding(.horizontal, 15)
                
            }
            .frame(width: sideBarWidth)
            .offset(x: isSidebarVisible ? 0 : -sideBarWidth)
            .animation(.default, value: isSidebarVisible)
            Spacer()
        }
    }
        

    
    var userProfile: some View {
        HStack {
            Image(systemName: "b.circle.fill")
                .resizable()
                .frame(width: 30, height: 30)
                .foregroundColor(.blue)
            Text("**Brynne Delaney**")
        }
    }
}



//struct Sidebar_Previews: PreviewProvider {
//    static var previews: some View {
//        Sidebar(isSidebarVisible: )
//    }
//}
