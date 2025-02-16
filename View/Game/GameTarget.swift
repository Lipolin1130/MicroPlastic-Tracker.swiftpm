//
//  GameTarget.swift
//  MicroPlastic Tracker
//
//  Created by 李柏霖 on 2025/2/14.
//

import SwiftUI

struct GameTarget: View {
    
    let target: Int
    let get: Int
    let imageName: String
    
    var body: some View {
        HStack(spacing: 30) {
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 60)
            
            Text("\(get) / \(target)")
                .font(.title2)
        }
        .frame(width: 300)
    }
}

#Preview {
    GameTarget(target: 2000, get: 2000, imageName: microbeads.imageName)
}
