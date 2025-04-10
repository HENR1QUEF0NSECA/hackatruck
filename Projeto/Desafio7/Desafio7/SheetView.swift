//
//  SheetView.swift
//  Desafio7
//
//  Created by Student13 on 03/08/23.
//

import SwiftUI

struct SheetView: View {
    @Binding var popLocation: location
    @Binding var isPresented: Bool
    
    var body: some View {
        Spacer()
        Text("\(popLocation.name)")
            .font(.title)
            .bold()
        
        AsyncImage(url: URL(string: popLocation.bandeira)) { image in
            image.resizable()
        }placeholder: {}
            .frame(width: 80, height: 50)
            .padding()
        
        Text(" Sobre:")
            .font(.title3)
            .frame(maxWidth: .infinity, alignment: .leading)
        Text("\(popLocation.description)")
            .font(.body)
            .padding()
        
        Spacer()
        Button("Dismiss"){
            isPresented = false
        }
        
        
        
    }
}
