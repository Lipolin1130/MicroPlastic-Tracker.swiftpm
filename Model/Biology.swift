//
//  Biology.swift
//  MicroPlastic Tracker
//
//  Created by 李柏霖 on 2025/2/14.
//

import Foundation

struct Biology: Hashable, Equatable {
    let id = UUID()
    var type: BiologyType
    var microplastic: Microplastic {// generate random microplastic by type
        switch type {
        case .salp: return Microplastic(content: Double.random(in: 0...5))
        case .shrimp: return Microplastic(content: Double.random(in: 5...20))
        case .anchovy: return Microplastic(content: Double.random(in: 20...100))
        case .skipjackTuna: return Microplastic(content: Double.random(in: 100...500))
        case .tuna: return Microplastic(content: Double.random(in: 500...5000))
        case .human: return Microplastic(content: Double.random(in: 5000...50000))
        }
    }
    
    var size: Double {
        switch type {
        case .salp: return Double.random(in: 10...15)
        case .shrimp: return Double .random(in: 10...30)
        case .anchovy: return Double.random(in: 10...50)
        case .skipjackTuna: return Double.random(in: 50...200)
        case .tuna: return Double.random(in: 50...200)
        case .human: return Double.random(in: 100...200)
        }
    }
}
