//
//  ContentView.swift
//  Atividade2
//
//  Created by Student13 on 27/07/23.
//

import SwiftUI

struct ContentView: View {
    @State var nomeUser = ""
    @State var onOff = false
    var body: some View {
        ZStack {
            Image("caminhao").resizable(capInsets: EdgeInsets(top: 0.0, leading: 350.0, bottom: 0.0, trailing: 600.0)
                ).scaledToFill()
                .frame(width: 850,height: 900)
                .position(.init(x: 300, y: 350))
                .opacity(0.15)
                .blur(radius: 1.5)
            
            VStack{
                Text("Bem vindo, \(nomeUser)" ).font(.largeTitle)
                    .position(.init(x: 180, y: 10))
                    .padding()
                
                TextField("Seu Nome", text: $nomeUser).position(.init(x: 170, y: (-100)))
                    .padding()
                    .multilineTextAlignment(.center)
                
                Image("logo").resizable()
                    .scaledToFit()
                    .frame(width: 250)
                    .shadow(radius: 10)
                
                
                Image("truck").resizable()
                    .scaledToFit()
                    .frame(width: 250, alignment: .center)
                    .shadow(radius: 10)
                
                Spacer()
                
                Button("Entrar"){
                    onOff = true
                }.frame(height: 200)
                    .position(.init(x: 180, y: 180))
                    .alert(isPresented: $onOff){
                        
                        Alert(title: Text("ALERTA!"),message: Text("Você irá iniciar o desafio da aula agora"), dismissButton: .default(Text("Vamos la")))
                    }
            }
            
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
