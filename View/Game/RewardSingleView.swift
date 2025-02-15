//
//  RewardSingleView.swift
//  MicroPlastic Tracker
//
//  Created by 李柏霖 on 2025/2/15.
//

import SwiftUI

struct RewardSingleView: View {
    
    let biology: CollectedBiology
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .fill(Color.gray)
                    .frame(width: 170, height: 170)
                    .overlay {
                        Image(biology.type.imageName())
                            .resizable()
                            .shilhouette(enabled: biology.enabled && biology.count > 0)
                            .padding()
                            .scaledToFit()
                    }
                if biology.enabled && biology.count > 0 {
                    Text("\(biology.count)")
                        .font(.largeTitle)
                }
            }
            
            Text(biology.type.rawValue)
                .font(.title2)
                .textCase(.uppercase)
            
        }
        .frame(width: 300)
        .monospaced()
    }
}

#Preview {
    RewardSingleView(biology: CollectedBiology(
        type: .salp,
        enabled: true)
    )
}
