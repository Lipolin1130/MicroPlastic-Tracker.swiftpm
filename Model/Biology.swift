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
    var microplastic: Microplastic {// generate random microplastic by type
        switch type {
        case .salp: return salp.microplastic
        case .shrimp: return northernPrawn.microplastic
        case .anchovy: return anchovy.microplastic
        case .skipjackTuna: return skipjackTuna.microplastic
        case .tuna: return atlanticBluefineTuna.microplastic
        case .human: return human.microplastic
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
    var position: CGPoint
}
