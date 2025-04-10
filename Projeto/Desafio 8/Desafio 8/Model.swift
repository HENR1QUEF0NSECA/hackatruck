//
//  Model.swift
//  Desafio 8
//
//  Created by Student13 on 04/08/23.
//let voiceLine: VoiceLine
//let abilities: [Abilities]
//

import Foundation

struct MidiaList: Decodable, Hashable{
    let id: Int?
    let wwise: String?
    let wave: String?
    
}

struct VoiceLine: Decodable, Hashable{
    let minDuration: Double?
    let maxDuration: Double?
    let midiaList: [MidiaList]?
}

struct Role: Decodable, Hashable{
    let uuid: String?
    let displayName: String?
    let description: String?
    let displayIcon: String?
    let assetPath: String?
}

struct Abilities: Decodable, Hashable{
    let slot: String?
    let displayName: String?
    let description: String?
    let displayIcon: String?
}

struct Data: Decodable, Hashable{
    let uuid: String?
    let displayName: String?
    let description: String?
    let developerName: String?
    let characterTags: [String]?
    let displayIcon: String?
    let displayIconSmall: String?
    let bustPortrait: String?
    let fullPortrait: String?
    let fullPortraitV2: String?
    let killfeedPortrait: String?
    let background: String?
    let backgroundGradientColors: [String?]
    let assetPath: String?
    let isFullPortraitRightFacing: Bool?
    let isPlayableCharacter: Bool?
    let isAvailableForTest: Bool?
    let isBaseContent: Bool?
    let role: Role?
    let abilities: [Abilities]?
    let voiceLine: VoiceLine?
}

struct Vava: Decodable, Hashable{
    let data: [Data]?
}
