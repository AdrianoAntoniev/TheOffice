//
//  CharactersView.swift
//  HelloWorld
//
//  Created by Adriano Rodrigues Vieira on 03/08/25.
//

import SwiftUI

struct CharacterView: View {
    //    @State private var character: CharacterDetailViewModel?
    @State private var loaderProgress = 0.0
    
    @ObservedObject var useCase: CharacterUseCase
    
    init(characterId: Int) {
        useCase = CharacterUseCase(characterId: characterId)
    }
    
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 10) {
                switch useCase.state {
                case .idle:
                    Text("")
                case .loading:
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .gray))
                case .failed(let error):
                    Text("Erro: \(error.localizedDescription)")
                case .success(let data):
                    let vm = CharacterDetailViewModel(detail: data)
                    
                    if let name = vm.name { Text(name) }
                    Spacer()
                    if let actor = vm.actor { Text(actor) }
                    if let episodesData = vm.episodesData { Text(episodesData) }
                    
                    if let jobs = vm.occupations { Text(jobs) }
                }
            }
        }.padding(.all, 12)
    }    
}
