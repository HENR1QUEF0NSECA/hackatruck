//
//  ContentView.swift
//  Desafio 9
//
//  Created by Student13 on 09/08/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationView{
            
            VStack {
                
                Text("Garagens:\n")
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .font(.title)
                    .bold()
                ForEach(viewModel.estacionamentos, id: \.self){ i in
                    
                    NavigationLink(destination: CarroView(carros: i.carro!)){
                        Text("\(i.nomeDoEStacionamento!)")
                            .font(.title2)
                        
                    }
                    
                }
            }
            .onAppear(){
                viewModel.fetch()
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
