//
//  CharacterDetail.swift
//  HelloWorld
//
//  Created by Adriano Rodrigues Vieira on 08/08/25.
//

import Foundation

struct CharacterDetail: Decodable {
    let actor: String?
    let episodes: [EpisodeData]?
    let firstAppearance: String?
    let gender: String?
    let job: [String]?
    let lastAppearance: String?
    let marital: String? // TODO: Verificar
    let name: String?
    let workplace: [String]?
}

struct EpisodeData: Decodable {
    let episode: Episode?
    let type: OptionalCodableEnum<EpisodeType>?
}

struct Episode: Decodable {
    let id: Int?
    let title: String?
}

enum EpisodeType: String, Decodable {
    case recurring = "RECURRING"
    case main = "MAIN"
}
