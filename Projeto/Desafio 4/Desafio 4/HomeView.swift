//
//  HomeView.swift
//  Desafio 4
//
//  Created by Student13 on 31/07/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        
        VStack{
            List{
                ForEach(1..<50){
                    Text("item \($0)")
                }
            }
        }//
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
