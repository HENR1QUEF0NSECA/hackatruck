//
//  Model2.swift
//  Desafio 8
//
//  Created by Student13 on 08/08/23.
//

import Foundation

struct Chroma:Decodable, Hashable{
    let uuid: String?
    let displayName: String?
    let fullRender: String?
    
}

struct Skin: Decodable, Hashable{
    let uuid: String?
    let displayName: String?
    let themeUuid:String?
    let contentTierUuid:String?
    let displayIcon:String?
    let chromas:[Chroma]?
}

struct DataGuns: Decodable, Hashable{
    let uuid: String?
    let displayName: String?
    let category: String?
    let defaultSkinUuid: String?
    let displayIcon: String?
    let KillStreamIcon: String?
    let assetPath: String?
    let skins: [Skin]?
}

struct VavaGuns: Decodable, Hashable{
    let data: [DataGuns]?
}
