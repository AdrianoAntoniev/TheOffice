//
//  CharacterUseCase.swift
//  TheOffice
//
//  Created by Adriano Rodrigues Vieira on 15/08/25.
//

import SwiftUI

class CharacterUseCase: ObservableObject {
    enum State {
        case idle
        case loading
        case failed(Error)
        case success(CharacterDetail)
    }

    @Published private(set) var state = State.idle
    private let characterId: Int

    init(characterId: Int) {
        self.characterId = characterId

        fetchCharacter()
    }

    private func fetchCharacter() {
        state = .loading

        NetworkManager().fetchCharacter(byId: self.characterId) { [weak self] result in
            guard let self else { return }

            switch result {
            case .success(let detail):
                self.state = .success(detail)
            case .failure(let error):
                self.state = .failed(error)
            }
        }
    }
}
