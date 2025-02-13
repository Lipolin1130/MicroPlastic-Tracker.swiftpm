//
//  File.swift
//  MicroPlastic Tracker
//
//  Created by 李柏霖 on 2025/2/11.
//

import Foundation

struct BiologyInfo: Hashable {
    let type: BiologyType
    let scientificName: String
    let imageName: String
    let introduction: String
    let characteristics: String
    let habitat: String
    let size: String
    let torphicLevel: torphicLevelType
    let microplastic: Microplastic
}

enum BiologyType: String {
    case salp = "Salp"
    case shrimp = "northern Prawn"
    case anchovy = "Anchovy"
    case skipjackTuna = "skipjack Tuna"
    case tuna = "Atlantic bluefine tuna"
    case human = "Human"
}

enum torphicLevelType: String {
    case primaryProducer = "Primary Producer" // 初級生產者
    case primaryConsumer = "Primary Consumer" // 初級消費者
    case secondaryConsumer = "Secondary Consumer" // 中級消費者
    case tertiaryConsumer = "Mid-level Predator" // 高級消費者
    case apexPredator = "Top-level Consumer" // 頂級消費者
    case topPredator = "Top Predator" // 高等生物
}

//    var microplastic: Microplastic {// generate random microplastic by type
//        switch type {
//        case .salp: return Microplastic(content: Double.random(in: 0...5))
//        case .redShrimp: return Microplastic(content: Double.random(in: 5...20))
//        case .anchovy: return Microplastic(content: Double.random(in: 20...100))
//        case .skipjackTuna: return Microplastic(content: Double.random(in: 100...500))
//        case .tuna: return Microplastic(content: Double.random(in: 500...5000))
//        case .human: return Microplastic(content: Double.random(in: 5000...50000))
//        }
//    }

