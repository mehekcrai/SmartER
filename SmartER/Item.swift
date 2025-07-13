//
//  Item.swift
//  SmartER
//
//  Created by Mehek Rai on 13/07/2025.
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
