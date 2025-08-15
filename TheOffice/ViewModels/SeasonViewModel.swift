//
//  SeasonViewModel.swift
//  HelloWorld
//
//  Created by Adriano Rodrigues Vieira on 04/08/25.
//

import Foundation

struct SeasonViewModel {
    private let season: Season

    init(seasonData: Season) {
        self.season = seasonData
    }

    var identifier: Int {
        season.id ?? .zero
    }

    var title: String {
        guard let number = season.number else {
            return ""
        }

        return "Temporada \(number)"
    }

    var subtitle: String {
        guard let startDate = season.startDate?.toBrazilianDate(),
              let endDate = season.endDate?.toBrazilianDate() else {
            return ""
        }

        return "Duração: De \(startDate) até \(endDate)."
    }
}

// MARK: - String extension

fileprivate extension String {
    func toBrazilianDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"

        guard let date = dateFormatter.date(from: self) else {
            return self
        }

        dateFormatter.dateFormat = "dd/MM/yyyy"
        return dateFormatter.string(from: date)
    }
}
