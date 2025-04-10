//
//  GunView.swift
//  Desafio 8
//
//  Created by Student13 on 09/08/23.
//

import SwiftUI

struct GunView: View {
    @State var gun: DataGuns
    
    var body: some View {
        ScrollView{
            Text(gun.displayName! + "\n")
                .font(.title)
                .bold()
            
            
            
            AsyncImage(url: URL(string: (gun.displayIcon!))) {
                image in image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()
            } placeholder: {
                Image(systemName: "photo.fill")
            }.frame(width: 130, height: 70)
            
            Text("Skins:\n")
                .font(.title)
            
            ForEach(gun.skins!, id: \.self){ s in
                VStack{
                    Text(s.displayName!)
                    
                    AsyncImage(url: URL(string: (s.displayIcon ?? gun.displayIcon!))) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .ignoresSafeArea()
                    } placeholder: {
                        Image(systemName: "photo.fill")
                    }.frame(width: 150, height: 80)
                }
            }
        }
    }
}

struct GunView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
