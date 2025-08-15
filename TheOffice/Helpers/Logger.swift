//
//  Logger.swift
//  HelloWorld
//
//  Created by Adriano Rodrigues Vieira on 08/08/25.
//

import Foundation

enum Logger {

    // MARK: Suffix

    private static let requestIcon = " 🚀 "
    private static let successIcon = " ✅ "
    private static let errorIcon = " ❌ "

    static func logRequest(_ request: URLRequest) {
        print(requestIcon + "\(request)")
    }

    static func logSuccess(_ data: Data, fromCache: Bool = false) {
        let suffix = "\(successIcon) \(fromCache ? "from CACHE: " : "")"
        print(suffix + (data.prettyJson ?? ""))
    }

    static func logError(_ error: Error) {
        print(errorIcon + error.localizedDescription)
    }

    static func logSavedObject(withKey key: String) {
        print(successIcon + " saving object with key \(key)")
    }
}
