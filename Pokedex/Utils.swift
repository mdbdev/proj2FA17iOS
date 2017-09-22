//
//  Utils.swift
//  Pods
//
//  Created by Louie McConnell on 9/21/17.
//
//

import Foundation
import Haneke

class Utils {
    static func getImage(url: String, withBlock: @escaping (UIImage) -> Void) {
        let cache = Shared.imageCache
        if let imageUrl = URL(string: url) {
            cache.fetch(URL: imageUrl).onSuccess({ img in
                    withBlock(img)
            })
        }
    }
}
