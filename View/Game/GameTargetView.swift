//
//  GameTarget.swift
//  MicroPlastic Tracker
//
//  Created by 李柏霖 on 2025/2/14.
//

import SwiftUI

struct GameTargetView: View {
    
    let target: Double
    let get: Double
    let imageName: String
    
    var body: some View {
        HStack(spacing: 30) {
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 60)
            
            Text("\(get, specifier: "%.1f") / \(get, specifier: "%.1f")")
                .font(.title2)
        }
        .frame(width: 300)
    }
}

#Preview {
    GameTargetView(target: 2000, get: 2000, imageName: microbeads.imageName)
}
