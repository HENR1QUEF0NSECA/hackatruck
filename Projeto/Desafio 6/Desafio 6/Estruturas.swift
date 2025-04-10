//
//  Estruturas.swift
//  Desafio 6
//
//  Created by Student13 on 01/08/23.
//

import Foundation

struct Music: Identifiable{
    var id: Int
    var name: String
    var artist: String
    var capa: String
}

struct Album: Identifiable{
    var id: Int
    var albumName: String
    var albumCapa: String
}
