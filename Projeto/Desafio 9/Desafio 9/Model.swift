//
//  Model.swift
//  Desafio 9
//
//  Created by Student13 on 09/08/23.
//

import Foundation

struct Carro: Decodable, Hashable{
    let modelo: String?
    let ano: Int?
    let cor: String?
    let preco: Double?
}

struct estacionamento: Decodable, Hashable{
    let _id: String?
    let _rev: String?
    let nomeDoEStacionamento: String?
    let endereco: String?
    let carro: [Carro]?
}
