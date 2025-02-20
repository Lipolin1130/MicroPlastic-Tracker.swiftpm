//
//  Biology.swift
//  MicroPlastic Tracker
//
//  Created by 李柏霖 on 2025/2/14.
//

import Foundation

struct Biology: Hashable, Equatable, Identifiable {
    let id = UUID()
    var type: BiologyType
    var microplastic: Microplastic {
        switch type {
        case .salp: return salp.microplastic
        case .shrimp: return northernPrawn.microplastic
        case .anchovy: return anchovy.microplastic
        case .skipjackTuna: return skipjackTuna.microplastic
        case .marlin: return atlanticBlueMarlin.microplastic
        case .human: return human.microplastic
        }
    }
    
    var size: Double {
        switch type {
        case .salp: return 75
        case .shrimp: return 100
        case .anchovy: return 125
        case .skipjackTuna: return 150
        case .marlin: return 200
        case .human: return 250
        }
    }
    var position: CGPoint
}
