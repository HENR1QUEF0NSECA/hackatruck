//
//  GunsView.swift
//  Desafio 8
//
//  Created by Student13 on 09/08/23.
//

import SwiftUI

struct GunsView: View {
    @StateObject var viewModel2 = ViewModel2()
    var body: some View {
        NavigationView(){
            
        ZStack{
            Color(.black)
                .ignoresSafeArea()
            VStack{
                AsyncImage(url: URL(string: "https://static.vecteezy.com/system/resources/previews/019/763/186/original/valorant-logo-transparent-free-png.png")!) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .ignoresSafeArea()
                } placeholder: {
                    Image(systemName: "photo.fill")
                }.frame(width: 100, height: 100)
                    .padding()
                
                ScrollView{
                    ForEach(viewModel2.guns, id: \.self){ g in
                        
                        ZStack{
                            NavigationLink(destination: GunView(gun: g)){
                                Rectangle()
                                    .foregroundColor(.white)
                                    .frame(height: 80)
                            }
                            
                            HStack{
                                AsyncImage(url: URL(string: (g.displayIcon!))!) { image in
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .ignoresSafeArea()
                                } placeholder: {
                                    Image(systemName: "photo.fill")
                                }.frame(width: 40, height: 30)
                                
                                Text("               ")
                                Text("\(g.displayName!)")
                                    .font(.title3)
                                    .bold()
                            }
                        }
                        
                        
                    }
                }
                
                }
                
            }
        }
        .onAppear(){
            viewModel2.fetch()
        }
    }
}

struct GunsView_Previews: PreviewProvider {
    static var previews: some View {
        GunsView()
    }
}
