//
//  ApiError.swift
//  HelloWorld
//
//  Created by Adriano Rodrigues Vieira on 03/08/25.
//

import Foundation

enum ApiError: LocalizedError {
    case noResponse
    case generic(String)
    case decodingError

    var errorDescription: String? {
        switch self {
        case .noResponse:
            return "Ops. Parece que houve algum problema ao obter os dados"
        case let .generic(error):
            return "Ops. Algo ocorreu: \(error)"
        case .decodingError:
            return "Ops. Erro ao decodificar o dado"
        }
    }
}
