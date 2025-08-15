//
//  CharactersViewModel.swift
//  HelloWorld
//
//  Created by Adriano Rodrigues Vieira on 06/08/25.
//

import Foundation

struct CharactersViewModel {
    private let characters: Characters

    init(characters: Characters) {
        self.characters = characters
    }

    var charactersList: [CharacterViewModel] {
        var value: [CharacterViewModel] = []

        if let results = characters.results {
            value = results.compactMap { CharacterViewModel(character: $0) }
        }

        return value
    }
}

struct CharacterViewModel: Hashable {
    let name: String
    let actor: String
    let id: Int

    init?(character: Character) {
        guard
            let safeName = character.name,
            let safeActor = character.actor,
            let safeId = character.id
        else {
            return nil
        }

        name = "Personagem: \(safeName)"
        actor = "Ator: \(safeActor)"
        id = safeId
    }
}
