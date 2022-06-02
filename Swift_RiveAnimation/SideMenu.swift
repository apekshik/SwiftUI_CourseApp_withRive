//
//  SideMenu.swift
//  Swift_RiveAnimation
//
//  Created by Apekshik Panigrahi on 6/2/22.
//

import SwiftUI
import RiveRuntime

struct SideMenu: View {
    @State var selectedMenu: SelectedMenu = .home
    let icon = RiveViewModel(fileName: "icons", stateMachineName: "HOME_interactivity", artboardName: "HOME")
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "person")
                    .padding(12)
                    .background(.white.opacity(0.2))
                    .mask(Circle())
                VStack(alignment: .leading, spacing: 2) {
                    Text("Apekshik Panigrahi")
                        .customFont(.body)
                    Text("Swift Developer")
                        .customFont(.subheadline)
                        .opacity(0.7)
                }
                Spacer()
            }
            .padding()
            
            Text("BROWSE")
                .customFont(.subheadline2)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 24)
                .opacity(0.7)
            VStack(alignment: .leading, spacing: 0) {
                ForEach(menuItems) { item in
                    Rectangle()
                        .frame(height: 1)
                        .opacity(0.1)
                        .padding(.horizontal)
                    HStack(spacing: 14) {
                        item.icon.view()
                            .frame(width: 32, height: 32)
                        .opacity(0.6)
                        Text(item.text)
                            .customFont(.headline)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(12)
                    .background(
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .fill(.blue)
                            .frame(maxWidth: selectedMenu == item.menu ? .infinity : 0)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    )
                    .background(Color(hex: "17203A").opacity(0.001)) // for some reason making a color completely trasparent removes it from being rendered. Hence the super small value of opacity.
                    .onTapGesture {
                        try? item.icon.setInput("active", value: true)
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            try? item.icon.setInput("active", value: false)
                        }
                        withAnimation {
                            selectedMenu = item.menu
                        }
                }
                }
            }
            .padding(8)
            
            Spacer()
        }
        .foregroundColor(.white)
        .frame(maxWidth: 288, maxHeight: .infinity)
        .background(LinearGradient(colors: [Color(hex: "17203A"), Color(hex: "17203A").opacity(0.8)], startPoint: .topLeading, endPoint: .bottomTrailing))
        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct SideMenu_Previews: PreviewProvider {
    static var previews: some View {
        SideMenu()
    }
}

struct MenuItem: Identifiable {
    var id = UUID()
    var text: String
    var icon: RiveViewModel
    var menu: SelectedMenu
}


var menuItems = [
    MenuItem(text: "Home", icon: RiveViewModel(fileName: "icons", stateMachineName: "HOME_interactivity", artboardName: "HOME"), menu: .home),
    MenuItem(text: "Search", icon: RiveViewModel(fileName: "icons", stateMachineName: "SEARCH_Interactivity", artboardName: "SEARCH"), menu: .search),
    MenuItem(text: "Favorites", icon: RiveViewModel(fileName: "icons", stateMachineName: "STAR_Interactivity", artboardName: "LIKE/STAR"), menu: .favorites),
    MenuItem(text: "Help", icon: RiveViewModel(fileName: "icons", stateMachineName: "CHAT_Interactivity", artboardName: "CHAT"), menu: .help)
]

enum SelectedMenu: String {
    case home
    case search
    case favorites
    case help
    case history
    case notifications
    case darkmode
}
