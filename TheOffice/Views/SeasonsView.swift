//
//  SeasonsView.swift
//  HelloWorld
//
//  Created by Adriano Rodrigues Vieira on 03/08/25.
//

import SwiftUI

struct SeasonsView: View {
    @State private var seasons: [SeasonViewModel] = .init()

    var body: some View {
        List(seasons, id: \.identifier) { season in
            if !season.title.isEmpty, !season.subtitle.isEmpty {
                NavigationLink {
                    // TODO: Remove
                    Text(season.title + "afafa")
                } label: {
                    VStack(alignment: .leading) {
                        Text(season.title)
                        Text(season.subtitle)
                    }

                }
            }
        }.onAppear {
            NetworkManager().fetchSeasons { result in
                switch result {
                case let .success(seasons):
                    self.seasons = seasons.map { SeasonViewModel(seasonData: $0)}
                case let .failure(error):
                    self.seasons = .init()
                }
            }
        }
    }
}

#Preview {
    SeasonsView()
}

