//
//  Mircoplastic.swift
//  MicroPlastic Tracker
//
//  Created by 李柏霖 on 2025/2/11.
//

struct Microplastic: Hashable {// 單位：微克
    var microbeads: Double
    var microfibers: Double
    var microfragments: Double
    
    init(content: Double) {
        let ratio1 = Double.random(in: 0...1)
        let ratio2 = Double.random(in: 0...(1 - ratio1))
        let ratio3 = 1 - ratio1 - ratio2
        
        self.microbeads = content * ratio1
        self.microfibers = content * ratio2
        self.microfragments = content * ratio3
    }
    
    init(microbeads: Double, microfibers: Double, microfragments: Double) {
        self.microbeads = microbeads
        self.microfibers = microfibers
        self.microfragments = microfragments
    }
}
