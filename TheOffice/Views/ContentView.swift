//
//  ContentView.swift
//  HelloWorld
//
//  Created by Adriano Rodrigues Vieira on 02/08/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            SeasonsView()
                .tabItem {
                    buildLabel(ofType: .seasons)
                }

            CharactersView()
                .tabItem {
                    buildLabel(ofType: .characters)
                }
        }
    }
}

#Preview {
    ContentView()
}
