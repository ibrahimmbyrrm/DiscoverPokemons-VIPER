//
//  CacheManager.swift
//  PokemonProject-VIPER
//
//  Created by İbrahim Bayram on 19.06.2023.
//

import Foundation

final class CacheManager {
    
    static let shared = CacheManager()
    private let cache = NSCache<NSString,AnyObject>()
    
    func readCacheData(forKey key : String) -> [CustomPokemon]? {
        return cache.object(forKey: key as NSString) as? [CustomPokemon]
    }
    
    func writeOnCache(object : AnyObject, forKey key : NSString) {
        cache.setObject(object, forKey: key)
        print("data has been saved on cache.")
    }
}
