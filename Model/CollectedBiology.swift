//
//  Collection.swift
//  MicroPlastic Tracker
//
//  Created by 李柏霖 on 2025/2/11.
//

struct CollectedBiology {
    let type: BiologyType
    var count: Int
    var enabled: Bool
    
    init(type: BiologyType, enabled: Bool) {
        self.type = type
        self.enabled = enabled
        count = 0
    }
}
