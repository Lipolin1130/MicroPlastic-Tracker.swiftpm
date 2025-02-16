//
//  AnimationDot.swift
//  MicroPlastic Tracker
//
//  Created by 李柏霖 on 2025/2/16.
//

import SwiftUI

struct AnimationDot: View {
    let position: CGPoint
    let color: Color
    @State private var animate = false
    
    var body: some View {
        NavigationLink {
            MicroplasticIntroView()
        } label: {
            
            Circle()
                .fill(color.opacity(0.9))
                .frame(width: 10, height: 10)
                .scaleEffect(animate ? 3 : 1)
                .opacity(animate ? 0.6 : 1)
                .overlay(
                    Circle()
                        .stroke(Color.white.opacity(0.8), lineWidth: 1)
                        .blur(radius: 2)
                        .scaleEffect(0.6)
                )
                .shadow(color: color, radius: animate ? 30 : 0, x: 3, y: 3)
                .animation(.easeInOut(duration: 1.2).repeatForever(autoreverses: true), value: animate)
                .blendMode(.screen)
                .position(position)
        }
        .onAppear {
            animate = true
        }
    }
}

#Preview {
    AnimationDot(position: .zero, color: .blue)
}
