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
    
    @State private var previosGet: Int = 0
    @State private var gainAnimations: [UUID: (Int, Double, CGFloat)] = [:]
    
    var body: some View {
        ZStack {
            HStack(spacing: 30) {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 60)
                
                Text("\(get) / \(target)")
                    .font(.title2)
            }
            
            ForEach(Array(gainAnimations.keys), id: \.self) { key in
                if let (amount, opacity, offsetY) = gainAnimations[key] {
                    Text("+\(amount)")
                        .font(.title2)
                        .bold()
                        .foregroundStyle(.white)
                        .opacity(opacity)
                        .offset(y: offsetY)
                        .animation(.easeOut(duration: 1), value: opacity)
                        .animation(.easeOut(duration: 1), value: offsetY)
                        .transition(.opacity)
                }
            }
        }
        .onChange(of: get) {newValue in
            if newValue > previosGet {
                let gainAmount = newValue - previosGet
                let animationID = UUID()
                
                gainAnimations[animationID] = (gainAmount, 1, -20)
                
                withAnimation(.easeOut(duration: 2)) {
                    gainAnimations[animationID]?.1 = 0
                    gainAnimations[animationID]?.2 = -40
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                    gainAnimations.removeValue(forKey: animationID)
                }
            }
            previosGet = newValue
        }
    }
}

#Preview {
    GameTarget(target: 2000, get: 2000, imageName: microbeads.imageName)
}
