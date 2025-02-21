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
    let introduction: String
    let characteristics: String
    let habitat: String
    let size: String
    let torphicLevel: torphicLevelType
    let microplastic: Microplastic
    
    static let requirements: [BiologyType: Microplastic] = [
        .salp: Microplastic(microbeads: 3, microfibers: 2, microfragments: 2),
        .shrimp: Microplastic(microbeads: 10, microfibers: 15, microfragments: 12),
        .anchovy: Microplastic(microbeads: 50, microfibers: 48, microfragments: 54),
        .skipjackTuna: Microplastic(microbeads: 258, microfibers: 264, microfragments: 280),
        .marlin: Microplastic(microbeads: 872, microfibers: 940, microfragments: 900),
        .human: Microplastic(microbeads: 2000, microfibers: 2000, microfragments: 2000)
    ]
}

enum BiologyType: String {
    case salp = "Salp"
    case shrimp = "Northern Prawn"
    case anchovy = "Anchovy"
    case skipjackTuna = "Skipjack Tuna"
    case marlin = "Atlantic blue marlin"
    case human = "Human"
}

enum torphicLevelType: String {
    case primaryProducer = "Primary Producer" // 初級生產者
    case primaryConsumer = "Primary Consumer" // 初級消費者
    case secondaryConsumer = "Secondary Consumer" // 中級消費者
    case tertiaryConsumer = "Mid-level Predator" // 高級消費者
    case apexPredator = "Apex Predator" // 頂級消費者
    case topPredator = "Top Predator" // 高等生物
}

