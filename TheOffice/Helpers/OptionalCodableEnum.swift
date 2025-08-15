//
//  OptionalCodableEnum.swift
//  HelloWorld
//
//  Created by Adriano Rodrigues Vieira on 09/08/25.
//


struct OptionalCodableEnum<D>: Decodable where D: Decodable {
    let value: D?

    init(from decoder: Decoder) throws {
        self.value = try? D(from: decoder)
    }
}
