//
//  PlayerData.swift
//  MicroPlastic Tracker
//
//  Created by 李柏霖 on 2025/2/12.
//

import Foundation

class GameService: ObservableObject {
    
    @Published var collectedBiology: [CollectedBiology] = []
    @Published var collectedMicroplastic: Microplastic = Microplastic(
        microbeads: 0,
        microfibers: 0,
        microfragments: 0
    )
    @Published var spawnedBiology: [Biology] = []
    
    let maxBiologyCount = 7
    
    var targetMicroplastic: Microplastic // Mission
    
    init() {
        collectedBiology = [
            CollectedBiology(type: .salp, enabled: true),
            CollectedBiology(type: .shrimp, enabled: true),
            CollectedBiology(type: .anchovy, enabled: false),
            CollectedBiology(type: .skipjackTuna, enabled: false),
            CollectedBiology(type: .tuna, enabled: false),
            CollectedBiology(type: .human, enabled: false)
        ]
        
        targetMicroplastic = Microplastic(
            microbeads: 5000,
            microfibers: 5000,
            microfragments: 5000
        )
        
        spawnBiology(count: maxBiologyCount)
    }
    
    func spawnBiology(count: Int) {
        for _ in 0..<count {
            spawnedBiology.append(generateBiology())
        }
    }
    
    @MainActor
    func collectBiology(biology: Biology) async {
        DispatchQueue.main.async {
            if let index = self.collectedBiology.firstIndex(where: { $0.type == biology.type }) {
                self.collectedBiology[index].count += 1
                self.collectedMicroplastic.addMicroplastic(microplastic: biology.microplastic)
            }
            
            if let index = self.spawnedBiology.firstIndex(where: { $0.id == biology.id }) {
                let newBiology = self.generateBiology()
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    // generate new biology
                    self.spawnedBiology[index] = newBiology
                }
            }
        }
    }
    
    func generateBiology() -> Biology {
        let biologyTypes: [BiologyType] = collectedBiology.filter({ $0.enabled }).map({ $0.type })
        let type = biologyTypes.randomElement()!
        return Biology(
            type: type,
            position: CGPoint(
                x: CGFloat.random(in: 50...500),
                y: CGFloat.random(in: 50...500)
            )
        )
    }
}
