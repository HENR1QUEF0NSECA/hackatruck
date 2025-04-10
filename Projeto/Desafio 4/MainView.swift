//
//  MainView.swift
//  Desafio 4
//
//  Created by Student13 on 31/07/23.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView{
            HomeView()
                .badge("!")
                .tabItem{
                    Label("Menu",systemImage: "list.dash")
                }
            SearchView()
                .tabItem{
                    Label("Search",systemImage: "magnifyingglass.circle.fill")
                }
            PhotosView()
                .tabItem{
                    Label("Photo",systemImage: "camera")
                }
            Menssages_View()
                .badge("2")
                .tabItem{
                    Label("Mensages",systemImage: "paperplane.fill")
                }
            ProfileView()
                .tabItem{
                    Label("Profile",systemImage: "person.circle.fill")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
