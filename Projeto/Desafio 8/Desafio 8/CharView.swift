//
//  CharView.swift
//  Desafio 8
//
//  Created by Student13 on 04/08/23.
//

import SwiftUI

struct CharView: View {
    @State var char: Data
    
    var body: some View {
        
        ZStack{
            Color(.black)
                .ignoresSafeArea()
            VStack{
                ScrollView{
                    VStack{
                        
                        Text(char.displayName!)
                            .font(.title)
                            .bold()
                            .foregroundColor(.white)
                        
                        ZStack{
                            AsyncImage(url: URL(string: (char.background!))!) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .ignoresSafeArea()
                            } placeholder: {
                                Image(systemName: "photo.fill")
                            }.frame(width: 300, height: 700)
                            
                            AsyncImage(url: URL(string: (char.fullPortrait!))!) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .ignoresSafeArea()
                            } placeholder: {
                                Image(systemName: "photo.fill")
                            }.frame(width: 300, height: 500)
                        }
                            
                        
                        Text(" Description")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.title)
                            .bold()
                            .foregroundColor(.white)
                            
                        Text("\(char.description!) \n")
                            .font(.title3)
                            .foregroundColor(.white)
                            .padding()
                        
                        Text(" Abilities\n")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.title)
                            .bold()
                            .foregroundColor(.white)
                        
                        ForEach(char.abilities!, id: \.self){ i in
                            VStack{
                                HStack{
                                    Text("\(i.displayName!) \n")
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .foregroundColor(.white)
                                        .font(.title3)
                                        .bold()
                                    
                                        
                                    AsyncImage(url: URL(string: (i.displayIcon!))!) { image in
                                        image
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .ignoresSafeArea()
                                    } placeholder: {
                                        Image(systemName: "photo.fill")
                                    }.frame(width: 50, height: 50)

                                }
                                Text("\(i.description!) \n")
                                    .font(.title3)
                                    .foregroundColor(.white)
                                    .padding()

                                
                            }
                            
                            
                        }
                        
                    }
                }
            }
            
        }
        
    }
}
