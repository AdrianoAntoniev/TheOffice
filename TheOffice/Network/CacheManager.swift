//
//  CacheManager.swift
//  HelloWorld
//
//  Created by Adriano Rodrigues Vieira on 12/08/25.
//

import Foundation
import Networkingo

struct CacheManager {
    private static let cache: NSCache<NSString, NSData> = .init()

    init() {
        fatalError("No one should instantiate me!")
    }

    static func save(data: Data, withKey key: String) {
        cache.setObject(data as NSData, forKey: key as NSString)
        Logger.logSavedObject(withKey: key)        
    }

    static func retrieveData(withKey key: String) -> Data? {
        cache.object(forKey: key as NSString) as? Data
    }
}
