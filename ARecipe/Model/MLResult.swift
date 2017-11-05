//
//  MLResult.swift
//  ARecipe
//
//  Created by kingcos on 04/11/2017.
//  Copyright © 2017 kingcos. All rights reserved.
//

import Foundation

struct MLResult: Codable {
    var href: [String]
    var material: [String]
    var pic: [String]
    var bbox: String
    var name: [String]
}
