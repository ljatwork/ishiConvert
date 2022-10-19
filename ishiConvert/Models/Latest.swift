//
//  Latest.swift
//  ishiConvert
//
//  Created by Leah Joy Ylaya on 7/6/22.
//

import Foundation

struct Latest: Codable {
    let disclaimer: String
    let license: String
    let timestamp: Int
    let base: String
    let rates: [String: Double]
}
