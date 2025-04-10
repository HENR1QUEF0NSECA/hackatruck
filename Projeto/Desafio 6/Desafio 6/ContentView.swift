//
//  ContentView.swift
//  Desafio 6
//
//  Created by Student13 on 01/08/23.
//

import SwiftUI

struct ContentView: View {
    @State var searchText = ""
    
    init(){
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().isTranslucent = true
        UITextField.appearance().backgroundColor = UIColor.white
        UITextField.appearance().tintColor = UIColor.black
    }
    
    var searchResults :[Music]{
        if searchText.isEmpty{
            return musics
        } else {
            return musics.filter{
                $0.name.lowercased().contains(searchText.lowercased()) || $0.artist.lowercased().contains(searchText.lowercased())}
        }
    }
    
    var musics = [
        Music(id: 1, name: "joao e maria", artist: "joao" ,capa: "https://i.pinimg.com/1200x/c8/0b/89/c80b89411ea7c8961526ef8d24ab0fb3.jpg"),
        Music(id: 2,name: "Joao botou ",artist: "joao" ,capa: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRiRaY9_xagcQ0G-7YueiNL4KnQBkt6Phblfg&usqp=CAU"),
        Music(id: 3,name: "joao melao",artist: "joao" ,capa: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS7vU7Wok2fMOvDLMhkSZO8FviUxyq1sSyHuw&usqp=CAU"),
        Music(id: 4,name: "pao",artist: "joao" ,capa: "https://i.pinimg.com/736x/06/22/0d/06220d1a1b6ccff04bebdb32d5663fb2.jpg"),
        Music(id: 5,name: "epilogo ",artist: "oao" ,capa: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRwUZd42OK0YDtNhMuVexqyQQssNS_v9e4D_w&usqp=CAU"),
        Music(id: 6,name: "narnia",artist: "Jao" ,capa: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT6qRHOTZRHURkG4EVXqnVARoHUwM7xzZIHbA&usqp=CAU"),
        Music(id: 7,name: "mano",artist: "joo" ,capa: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR3ANCXeRg1UKnxfL7YxeDmn9kcZ5PdjHs9fA&usqp=CAU"),
        Music(id: 8,name: "bow",artist: "joa" ,capa: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRnVMJ0-wqlQJmI22_7rPfyFsTA5jgP5Q-Utfzj7pHYBV4RAHC-Hfgwe7Qmn6XRm9AJ3bI&usqp=CAU")
        
    ]
    
    var albuns = [
        Album(id: 10,albumName: "Album1",albumCapa: "https://e0.pxfuel.com/wallpapers/896/859/desktop-wallpaper-inespics%E2%9C%A7-cartoon-profile-pics-girl-aesthetic-cartoon-thumbnail.jpg"),
        Album(id: 11,albumName: "Album2",albumCapa: "https://w0.peakpx.com/wallpaper/35/905/HD-wallpaper-aesthetic-cartoon-trippy-cartoon-thumbnail.jpg"),
        Album(id: 12,albumName: "Album3",albumCapa: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSdivd9jB8AMzI7ty3gKVeQLMFpkwrRuOIrFA&usqp=CAU")
        
    ]
    
    var body: some View {
        NavigationStack{
                ZStack{
                    LinearGradient(gradient: Gradient(colors: [.blue,.black]), startPoint: .top, endPoint: .bottom).ignoresSafeArea()
                    ScrollView{
                    VStack{
                        
                        Text(" ")
                        
                        AsyncImage(url: URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQmkp932RMeqj-1xusF2b63oZe5enf1YlWnhg&usqp=CAU")) { image in
                            image.resizable()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 200, height: 200)
                        
                            Text("  Mario FM")
                                .font(.title)
                                .foregroundColor(.white)
                                .frame(maxWidth:
                                        .infinity, alignment: .leading)
                        HStack{
                            Text("  ")
                            AsyncImage(url: URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQmkp932RMeqj-1xusF2b63oZe5enf1YlWnhg&usqp=CAU")) { image in
                                image.resizable()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 20, height: 20)
                            
                            Text("HackaSong")
                                .foregroundColor(.white)
                                .font(.callout)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                        }
                        
                        
                        
                        ForEach(searchResults){music in
                            HStack{
                                AsyncImage(url: URL(string: music.capa)) { image in
                                    image.resizable()
                                } placeholder: {
                                    ProgressView()
                                }
                                .frame(width: 50, height: 50)
                                
                                VStack{
                                    NavigationLink(destination: musicView(music: music)){
                                        Text(music.name)
                                            .font(.title2)
                                            .foregroundColor(.white)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                    }
                                    
                                    Text(music.artist)
                                        .font(.callout)
                                        .foregroundColor(.white)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    
                                }
                                Text("...")
                                    .foregroundColor(.white)
                            }.padding()
                            
                        }
                        Text("Sugeridos")
                            .padding()
                            .font(.title)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        
                        ScrollView(.horizontal) {
                            HStack(spacing: 20) {
                                    ForEach(albuns) { album in
                                        VStack{
                                            AsyncImage(url: URL(string: album.albumCapa)) { image in
                                                image.resizable()
                                            } placeholder: {
                                                ProgressView()
                                            }
                                            .frame(width: 200, height: 200)
                                            
                                            Text(album.albumName)
                                                .font(.title2)
                                                .foregroundColor(.white)
                                        }
                                    }
                                
                            }
                        }
                    }
                }
                }.searchable(text: $searchText)
                
                
            
        }.accentColor(.white)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
