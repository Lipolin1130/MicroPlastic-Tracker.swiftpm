//
//  Mircoplastic.swift
//  MicroPlastic Tracker
//
//  Created by 李柏霖 on 2025/2/11.
//

struct Microplastic: Hashable {// 單位：微克
    var microbeads: Int
    var microfibers: Int
    var microfragments: Int
    
    init(microbeads: Int, microfibers: Int, microfragments: Int) {
        self.microbeads = microbeads
        self.microfibers = microfibers
        self.microfragments = microfragments
    }
    
    mutating func addMicroplastic(microplastic: Microplastic) {
        self.microbeads += microplastic.microbeads
        self.microfibers += microplastic.microfibers
        self.microfragments += microplastic.microfragments
    }
}
