//
//  Model.swift
//  TesteApp
//
//  Created by StudentBackup01 on 21/08/23.
//

import Foundation


struct jogos: Hashable, Decodable {
    let usuario : String
    let foto : String
    let modalidade : String
    let local: String
    let descricao : String?
    let sexo : String
    let horario : String
    let data : String
    let nivel : String
    let preco : Double
    let vagas : Int
    var listaParticipantes : [usuarios]
}

struct usuarios: Hashable, Codable {
    let foto : String
    let nick : String
    let nome : String
    let sexo : String
    let idade : Int
    let descricao : String?
    let avaliacao : Double
    let numAvaliacao : Int
    let numParticipacao : Int
    let interesses : [String]
}

struct solicitacoes : Hashable, Decodable {
    let remetente : usuarios
    let usuario : String
    let modalidade : String
    let local : String
    let descricao : String?
    let sexo : String
    let horario : String
    let data : String
    let nivel : String
    let preco : Double
    let vagas : Int
}
