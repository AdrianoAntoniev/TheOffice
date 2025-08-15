//
//  CharactersView.swift
//  HelloWorld
//
//  Created by Adriano Rodrigues Vieira on 03/08/25.
//

import SwiftUI

struct CharacterView: View {
    @State private var character: CharacterDetailViewModel?
    let characterId: Int

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 10) {
                if let name = character?.name { Text(name) }
                Spacer()
                if let actor = character?.actor { Text(actor) }
                if let episodesData = character?.episodesData { Text(episodesData) }
                
                if let jobs = character?.occupations { Text(jobs) }
            }
        }.padding(.all, 12)
        .onAppear {
            NetworkManager().fetchCharacter(byId: characterId) { result in
                switch result {
                case .success(let data):
                    character = CharacterDetailViewModel(detail: data)
                case .failure(let error):
                    print("error")
                }
            }
        }

    }
}

//#Preview {
//    CharacterView(characterId: 0)
//}
//
