//
//  RandomImage.swift
//  MicroPlastic Tracker
//
//  Created by 李柏霖 on 2025/2/18.
//

import SwiftUI

struct RandomImage: View {
    let imageName: String
    let count: Int
    
    var body: some View {
        VStack {
            GeometryReader { geometry in
                let centerX = geometry.size.width / 2
                let centerY = geometry.size.height / 2
                let centerSize: CGFloat = 400
                
                ForEach(0..<count, id: \.self) {_ in
                    let position = generateValidPosition(
                        in: geometry.size,
                        avoiding: CGRect(
                            x: centerX - centerSize / 2,
                            y: centerY - centerSize / 2,
                            width: centerSize,
                            height: centerSize)
                    )
                    
                    Image(imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100)
                        .position(position)
                        .opacity(Double.random(in: 0.2...0.8))
                        .rotationEffect(.degrees(Double.random(in: 0...359)))
                }
            }
        }
        .frame(width: UIScreen.main.bounds.width - 50, height: UIScreen.main.bounds.height - 50)
    }
    
    private func generateValidPosition(in size: CGSize, avoiding exclusionZone: CGRect) -> CGPoint {
        var position: CGPoint
        repeat {
            position = CGPoint(
                x: CGFloat.random(in: 50...(size.width - 50)),
                y: CGFloat.random(in: 50...(size.height - 50))
            )
        } while exclusionZone.contains(position)
        return position
    }
}

#Preview {
    RandomImage(imageName: "bottle", count: 5)
}


