//
//  CharacterDetailViewModel.swift
//  HelloWorld
//
//  Created by Adriano Rodrigues Vieira on 08/08/25.
//

import Foundation

struct CharacterDetailViewModel {
    private let detail: CharacterDetail

    init(detail: CharacterDetail) {
        self.detail = detail
    }

    var name: String? {
        guard let name = detail.name else { return nil }

        return "Nome do personagem: \(name.capitalized)"
    }

    var actor: String? {
        guard let actor = detail.actor else { return nil }

        return "Intérprete: \(actor)"
    }

    var episodesData: String? {
        guard let episodes = detail.episodes, !episodes.isEmpty else { return nil }
        guard let actor = detail.actor, let name = detail.name else { return nil }


        let title = "\(actor), como  \(name), participou dos seguintes episódios (em inglês):\n"

        return episodes.reduce(into: title) { partialResult, episode in
            guard let episodeTitle = episode.episode?.title else { return }

            partialResult += " • \(episodeTitle):\n"
        }
    }

    var occupations: String? {
        guard let name = detail.name else { return nil }

        guard let jobs = detail.job, !jobs.isEmpty else {
            return "\(name) não possui emprego."
        }

        let value = "\(name) ocupou os seguintes cargos (em inglês): \n"
        return jobs.reduce(into: value) { partialResult, job in
            partialResult += " • \(job)\n"
        }
    }
}
