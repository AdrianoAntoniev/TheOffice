//
//  CharactersView.swift
//  HelloWorld
//
//  Created by Adriano Rodrigues Vieira on 03/08/25.
//

import SwiftUI

struct CharactersView: View {
    @State private var characters: CharactersViewModel?

    var body: some View {
        NavigationView {
            List(characters?.charactersList ?? [], id: \.self) { character in
                NavigationLink(destination: CharacterView(characterId: character.id)) {
                    VStack(alignment: .leading) {
                        Text(character.name)
                        Text(character.actor)
                    }
                }
            }.onAppear {
                NetworkManager().fetchCharacters { result in
                    switch result {
                    case let .success(data):
                        self.characters = .init(characters: data)
                    case let .failure(error):
                        // TODO: Handle error
                        break
                    }
                }
            }
        }
    }
}

#Preview {
    CharactersView()
}

