//
//  ContentView.swift
//  button
//
//  Created by Student13 on 28/07/23.
//

import SwiftUI

struct ContentView: View {
    @State var confirma = false
    @State var nega = false
    var body: some View {
        VStack {
            Text("Você é Burro?")
                .font(.largeTitle)
                .padding()
            
            HStack{
                Button("Yes") {
                    confirma = true
                }
                .alert("A sinceridade é o melhor caminho", isPresented: $confirma) {
                    Button("OK", role: .cancel) {
                        nega = false
                    }
                    }
                ZStack{
                    if nega == false{
                        Button("No"){
                            nega.toggle()
                        }
                    }else{
                        Rectangle()
                            .frame(width: 30,height: 20)
                    }

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
