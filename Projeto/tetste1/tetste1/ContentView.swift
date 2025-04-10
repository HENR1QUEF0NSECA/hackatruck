//
//  ContentView.swift
//  tetste1
//
//  Created by Student13 on 27/07/23.
//

import SwiftUI

struct ContentView: View {
    @State var inOn = false
    @State var onOff = false
    var body: some View {
        VStack {
            Image("caminhao").resizable().scaledToFit()
            Text("Hacka Truck").foregroundColor(.blue)
                .font(.largeTitle)
                .fontDesign(.default)
                .bold(true)
            HStack{
                Text("Makes").font(.title3)
                    .foregroundColor(.yellow)
                Text("Space").font(.title3)
                    .foregroundColor(.red)
            }
        }
        .padding()
    }
}

struct secondView: View {
    
    var body: some View {
        
        VStack {
            Image("caminhao").resizable()
                .scaledToFill()
                .frame(width: 380, height: 200)
                .clipped()
            
                
            
            ZStack{
                Image("caminhao").resizable().scaledToFit()
                    .clipShape(Circle())
                    .position(.init(x: 175, y: 130))
                Text("HackaTruck").font(.title)
                    .bold(true)
                    .position(.init(x: 170, y: 85))
                    .foregroundColor(.blue)
            }
            ZStack{
                Rectangle().frame(width: 250, height: 160)
                    .position(.init(x: 175, y: 140))
                HStack{
                    Text("Maker").foregroundColor(.yellow).font(.title2)
                    Text("Space").foregroundColor(.red).font(.title2)
                }
            }
            
        }.padding()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        secondView()
    }
}
