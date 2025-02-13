//
//  PlayerData.swift
//  MicroPlastic Tracker
//
//  Created by 李柏霖 on 2025/2/12.
//

import Foundation

class PlayerData: ObservableObject {
    //all collected biology
    @Published var collectedBiology: [CollectedBiology] = []
    //all collected microplastic
    @Published var collectedMicroplastic: Microplastic = Microplastic(content: 0)
    
    init() {
        collectedBiology = [
            CollectedBiology(type: .salp, enabled: false),
            CollectedBiology(type: .shrimp, enabled: true),
            CollectedBiology(type: .anchovy, enabled: true),
            CollectedBiology(type: .skipjackTuna, enabled: false),
            CollectedBiology(type: .tuna, enabled: false),
            CollectedBiology(type: .human, enabled: false)
        ]
    }
}
