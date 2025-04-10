//
//  MainView.swift
//  Desafio 8
//
//  Created by Student13 on 08/08/23.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        
        TabView{
            AgentView()
                .tabItem{
                    Label("Agent",systemImage: "list.dash")
                }
            GunsView()
                .tabItem{
                    Label("Guns",systemImage: "paperplane.fill")
                }
        }
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
