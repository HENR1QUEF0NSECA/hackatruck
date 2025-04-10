//
//  GunsView.swift
//  Desafio 8
//
//  Created by Student13 on 08/08/23.
//

import SwiftUI

struct GunsView: View {
    @StateObject var viewModel2 = ViewModel2()
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GunsView()
    }
}
