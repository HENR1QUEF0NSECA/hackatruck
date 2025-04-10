//
//  SearchView.swift
//  Desafio 4
//
//  Created by Student13 on 31/07/23.
//

import SwiftUI

struct SearchView: View {
    var body: some View {
        
        ZStack{
            Rectangle()
                .frame(width: 200, height: 200)
                .foregroundColor(.blue)
            
            Text("HACKA TRUCK")
                .bold()
                .foregroundColor(.white)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
