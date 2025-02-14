//
//  GameBiologyView.swift
//  MicroPlastic Tracker
//
//  Created by 李柏霖 on 2025/2/14.
//

import SwiftUI

struct GameBiologyView: View {
    @State private var position: CGPoint
    let biology: Biology
    let onTap: () -> Void
    
    @Binding private var areaSize: CGSize
    
    init(biology: Biology, areaSize: Binding<CGSize>, onTap: @escaping () -> Void) {
        self.biology = biology
        self._areaSize = areaSize
        self.onTap = onTap
        _position = State(initialValue: .zero)
    }
    
    var body: some View {
        Image(biology.type.imageName())
            .resizable()
            .scaledToFit()
            .frame(width: 100, height: 100)
            .position(position)
            .onTapGesture {
                onTap()
            }
            .onAppear {
                startMoving()
            }
            .onChange(of: areaSize) { newSize in
                if newSize.width > 0, newSize.height > 0 {
                    position = CGPoint(
                        x: CGFloat.random(in: 100...(newSize.width - 100)),
                        y: CGFloat.random(in: 100...(newSize.height - 100))
                    )
                }
            }
    }
    
    private func startMoving() {
        Timer.scheduledTimer(withTimeInterval: Double.random(in: 2...4), repeats: true) { _ in
            DispatchQueue.main.async {
                withAnimation(.easeInOut(duration: 2.0)) {
                    position = CGPoint(
                        x: CGFloat.random(in: 50...(areaSize.width - 50)),
                        y: CGFloat.random(in: 50...(areaSize.height - 50))
                    )
                }
            }
        }
    }
}
