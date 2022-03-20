//
//  ImgCacheManager.swift
//  FlowDataMvvM
//
//  Created by BSergio on 20.03.2022.
//

import Foundation
import SwiftUI

class ImgCacheManager {
    static var instance = ImgCacheManager()
    var imgCache: NSCache<NSString, UIImage> = {
        var cache = NSCache<NSString, UIImage>()
        cache.countLimit = 100
        cache.totalCostLimit = 1024 * 1024 * 100 // ~ 200mb
        return cache
    }()
    
    private init() { }
    
    func add(key: String, value: UIImage) {
        imgCache.setObject(value, forKey: key as NSString)
    }
    
    func get(key: String) -> UIImage? {
        return imgCache.object(forKey: key as NSString)
    }
}
