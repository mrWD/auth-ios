//
//  Item.swift
//  auth
//
//  Created by Viktor Lavrov on 14.09.24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
