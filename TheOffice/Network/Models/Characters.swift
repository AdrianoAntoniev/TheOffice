//
//  Characters.swift
//  HelloWorld
//
//  Created by Adriano Rodrigues Vieira on 06/08/25.
//

struct Characters: Decodable {
    let results: [Character]?
}

struct Character: Decodable {
    let id: Int?
    let name: String?
    let actor: String?
}
