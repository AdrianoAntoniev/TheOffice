//
//  NetworkManager.swift
//  HelloWorld
//
//  Created by Adriano Rodrigues Vieira on 03/08/25.
//

import Foundation

final class NetworkManager: Repository<Endpoint> {
    func fetchSeasons(completion: @escaping ResultHandler<[Season]>) {
        doRequest(.getSeasons, performing: completion)
    }

    func fetchCharacters(
        includingEpisodes includeEpisodes: Bool = false,
        withLimit limit: Int? = nil,
        completion: @escaping ResultHandler<Characters>
    ) {
        doRequest(.getCharacters(includeEpisodes: includeEpisodes, limit: limit), performing: completion)
    }

    func fetchCharacter(byId id: Int, completion: @escaping ResultHandler<CharacterDetail>) {
        doRequest(.getCharacter(byId: id, includeEpisodes: true), performing: completion)
    }
}
