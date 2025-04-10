//
//  CarroView.swift
//  Desafio 9
//
//  Created by Student13 on 09/08/23.
//

import SwiftUI

struct CarroView: View {
    
    @State var carros: [Carro]
    var body: some View {
        VStack{
            
            Text("Carros disponiveis:\n")
                .frame(maxWidth: .infinity,alignment: .leading)
                .font(.title)
                .bold()
            ForEach(carros, id: \.self){ c in
                
                    Text("Modelo: " + c.modelo!)
                    Text("Cor: " + c.cor!)
                    Text("Ano: " + String(c.ano!))
                    Text("Preço: " + String(c.preco!) + "0\n")

            }
            
        }
    }
}

struct CarroView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
