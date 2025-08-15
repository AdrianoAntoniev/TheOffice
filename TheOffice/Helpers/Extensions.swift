//
//  Extensions.swift
//  HelloWorld
//
//  Created by Adriano Rodrigues Vieira on 08/08/25.
//

import Foundation

// MARK: - Data

extension Data {

    /// Given a `Data` object, prints its relative `JSON`
    var prettyJson: String? {
        guard let object = try? JSONSerialization.jsonObject(with: self, options: []),
              let data = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted, .sortedKeys]),
              let result = String(data: data, encoding: .utf8)
        else {
            return nil
        }

        return result
    }
}
