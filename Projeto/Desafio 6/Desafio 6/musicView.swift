//
//  musicView.swift
//  Desafio 6
//
//  Created by Student13 on 01/08/23.
//

import SwiftUI

struct musicView: View {
    @State var music: Music
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.blue,.black]), startPoint: .top, endPoint: .bottom).ignoresSafeArea()
            VStack{
                Spacer()
                AsyncImage(url: URL(string: music.capa)) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 200, height: 200)
                Text(music.name)
                    .font(.title2)
                    .foregroundColor(.white)
                
                Text(music.artist)
                    .foregroundColor(.white)
                
                Spacer()
                
                HStack{
                    Image(systemName: "shuffle")
                        .resizable()
                        .frame(width: 40,height: 40)
                        .foregroundColor(.white)
                        .padding()
                    Image(systemName: "backward.end.fill")
                        .resizable()
                        .frame(width: 40,height: 40)
                        .foregroundColor(.white)
                        .padding()
                    Image(systemName: "play.fill")
                        .resizable()
                        .frame(width: 40,height: 40)
                        .foregroundColor(.white)
                        .padding()
                    Image(systemName: "forward.end.fill")
                        .resizable()
                        .frame(width: 40,height: 40)
                        .foregroundColor(.white)
                        .padding()
                    Image(systemName: "repeat").resizable()
                        .frame(width: 40,height: 40)
                        .foregroundColor(.white)
                        .padding()

                }
                Spacer()
            }
        }
        
        
    }
}

struct musicView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
