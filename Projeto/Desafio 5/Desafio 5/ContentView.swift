//
//  ContentView.swift
//  Desafio 5
//
//  Created by Student13 on 31/07/23.
//

import SwiftUI

struct SheetView: View {


    var body: some View {
        Text("opa")
    }
}

struct ContentView: View {
    @State private var showingSheet = false
    @State var nome = ""
    var body: some View {
        NavigationStack{
            VStack {
                NavigationLink(destination: Pagina2_aView()){
                    Text("Modo 1")
                }
                NavigationLink(destination: Pagina2_bView()){
                    Text("Modo 2")
                        .foregroundColor(.black)
                        .font(.title)
                }
                Button("Modo 3") {
                    showingSheet.toggle()
                }
                .sheet(isPresented: $showingSheet) {
                    SheetView()
                }
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
