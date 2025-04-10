//
//  PhotosView.swift
//  Desafio 4
//
//  Created by Student13 on 31/07/23.
//

import SwiftUI

struct PhotosView: View {
    var body: some View {
        ScrollView(showsIndicators: false){
            VStack{
                Image(systemName: "figure.volleyball")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                
                Image(systemName: "figure.water.fitness")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                
                Image(systemName: "figure.strengthtraining.traditional")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                
                Image(systemName: "figure.tennis")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                
                Image(systemName: "figure.surfing")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                
                Image(systemName: "figure.soccer")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                
            }
        }
    }
}

struct PhotosView_Previews: PreviewProvider {
    static var previews: some View {
        PhotosView()
    }
}
