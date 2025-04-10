//
//  ContentView.swift
//  Desafio 8
//
//  Created by Student13 on 04/08/23.
//ForEach(viewModel.chars, id: \.self){ i in

import SwiftUI

struct AgentView: View {
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationStack {
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
                        ForEach(viewModel.chars, id: \.self){ i in
                            
                            ZStack{
                                NavigationLink(destination: CharView(char: i)){
                                    Rectangle()
                                        .foregroundColor(.white)
                                        .frame(height: 80)
                                }
                                
                                HStack{
                                    Text(" ")
                                    AsyncImage(url: URL(string: (i.displayIcon!))!) { image in
                                        image
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .ignoresSafeArea()
                                    } placeholder: {
                                        Image(systemName: "photo.fill")
                                    }.frame(width: 50, height: 50)
                                    
                                    Text(" \(i.displayName!)     ")
                                        .frame(maxWidth: .infinity, alignment: .leading)
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
            viewModel.fetch()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AgentView()
    }
}
