//
//  PlayerData.swift
//  MicroPlastic Tracker
//
//  Created by 李柏霖 on 2025/2/12.
//

import Foundation

class GameService: ObservableObject {
    
    @Published var collectedBiology: [CollectedBiology] = []
    @Published var collectedMicroplastic: Microplastic = Microplastic(content: 0)
    @Published var spawnedBiology: [Biology] = []
    
    let maxBiologyCount = 7
    
    var targetMicroplastic: Microplastic // Mission
    
    init() {
        collectedBiology = [
            CollectedBiology(type: .salp, enabled: false),
            CollectedBiology(type: .shrimp, enabled: true),
            CollectedBiology(type: .anchovy, enabled: true),
            CollectedBiology(type: .skipjackTuna, enabled: false),
            CollectedBiology(type: .tuna, enabled: false),
            CollectedBiology(type: .human, enabled: false)
        ]
        
        targetMicroplastic = Microplastic(
            microbeads: 2000,
            microfibers: 2000,
            microfragments: 2000
        )
        
        spawnBiology(count: maxBiologyCount)
    }
    
    func spawnBiology(count: Int) {
        for _ in 0..<count {
            spawnedBiology.append(generateBiology())
        }
    }
    
    func collectBiology(biology: Biology) {
        if let index = collectedBiology.firstIndex(where: { $0.type == biology.type }) {
            collectedBiology[index].count += 1
            collectedMicroplastic.addMicroplastic(microplastic: biology.microplastic)
        }
        
        spawnedBiology.removeAll(where: { $0.id == biology.id })
        
        // generate new biology
        spawnedBiology.append(generateBiology())
    }
    
    func generateBiology() -> Biology {
        let biologyTypes: [BiologyType] = collectedBiology.filter({ $0.enabled }).map({ $0.type })
        let type = biologyTypes.randomElement()!
        return Biology(type: type)
    }
    
}
