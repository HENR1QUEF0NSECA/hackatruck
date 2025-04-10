//
//  Pagina2.aView.swift
//  Desafio 5
//
//  Created by Student13 on 31/07/23.
//

import SwiftUI

struct Pagina2_aView: View {
    @State var name = ""
    var body: some View {
        NavigationStack{
            VStack {
                Text("Seja bem vindo!")
                TextField("digite seu nome", text: $name)
                    .multilineTextAlignment(.center)
                
                
                NavigationLink(destination: Text("volte \(name)")){
                    Text("Continuar")
                }.padding()
            }
        }
    }
}

struct Pagina2_aView_Previews: PreviewProvider {
    static var previews: some View {
        Pagina2_aView()
    }
}
