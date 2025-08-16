//
//  Endpoint.swift
//  HelloWorld
//
//  Created by Adriano Rodrigues Vieira on 06/08/25.
//

import Foundation
import Networkingo

enum Endpoint: RawRequest {
    case getSeasons
    case getCharacters(includeEpisodes: Bool, limit: Int?)
    case getCharacter(byId: Int, includeEpisodes: Bool)

    var method: Networkingo.Method {
        switch self {
        case .getSeasons:
            return .get
        case .getCharacters:
            return .get
        case .getCharacter:
            return .get
        }
    }

    var path: String {
        switch self {
        case .getSeasons:
            return "https://theofficeapi.dev/api/seasons"
        case .getCharacters:
            return "https://theofficeapi.dev/api/characters"
        case let .getCharacter(id, _):
            return "https://theofficeapi.dev/api/character/\(id)"
        }
    }

    var queryItems: [URLQueryItem] {
        var queryItems = [URLQueryItem].init()

        switch self {
        case .getSeasons:
            break
        case .getCharacters(let includeEpisodes, let limit):
            queryItems.append(.init(name: "includeEpisodes", value: String(describing: includeEpisodes)))
            queryItems.append(.init(name: "limit", value: String(describing: limit ?? Constants.allCharactersCount)))
        case .getCharacter(_, let includeEpisodes):
            queryItems.append(.init(name: "includeEpisodes", value: String(describing: includeEpisodes)))
        }

        return queryItems
    }

    var cache: Bool {
        true
    }

    private enum Constants {
        // Number obtained empirically
        static let allCharactersCount: Int = 100
    }
}
