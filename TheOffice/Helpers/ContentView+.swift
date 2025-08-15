//
//  ContentView+.swift
//  HelloWorld
//
//  Created by Adriano Rodrigues Vieira on 03/08/25.
//

import SwiftUI

extension ContentView {
    enum LabelType {
        case seasons
        case characters
    }


    func buildLabel(ofType type: LabelType) -> some View {
        let text: String
        let image: String

        switch type {
        case .seasons:
            text = "Seasons"
            image = "list.dash"
        case .characters:
            text = "Characters"
            image = "square.and.pencil"
        }

        return Label(text, systemImage: image)
    }
}
