//
//  GameBiologyView.swift
//  MicroPlastic Tracker
//
//  Created by 李柏霖 on 2025/2/14.
//

import SwiftUI

struct GameBiologyView: View {
    @State var position: CGPoint
    let biology: Biology
    let onTap: () -> Void
    
    @Binding private var areaSize: CGSize
    @State private var movementTimer: Timer?
    
    init(biology: Biology, areaSize: Binding<CGSize>, onTap: @escaping () -> Void) {
        self.biology = biology
        self._areaSize = areaSize
        self.onTap = onTap
        self._position = State(initialValue: biology.position)
    }
    
    var body: some View {
        Image(biology.type.imageName())
            .resizable()
            .scaledToFit()
            .frame(width: 100, height: 100)
            .position(position)
            .onTapGesture {
                stopMoving()
                onTap()
            }
            .onAppear {
                if areaSize.width > 0 && areaSize.height > 0 {
                    updatePosition()
                    startMoving()
                }
            }
            .onDisappear {
                stopMoving()
            }
            .onChange(of: areaSize) { newSize in
                if newSize.width > 0 && newSize.height > 0 {
                    updatePosition()
                }
            }
    }
    
    private func updatePosition() {
        
        let halfHeight: CGFloat = 50
        
        guard areaSize.height > 100 else { return }
        
        position = CGPoint(
            x: CGFloat.random(in: 50...(areaSize.width - halfHeight)),
            y: CGFloat.random(in: 50...(areaSize.height - halfHeight))
        )
        
        position.y = min(position.y, areaSize.height - halfHeight)
        
//        print("Updated Position - x:", position.x, "y:", position.y, "areaSize.height:", areaSize.height)
    }
    
    private func startMoving() {
        Timer.scheduledTimer(withTimeInterval: Double.random(in: 2...4), repeats: true) { _ in
            DispatchQueue.main.async {
                withAnimation(.easeInOut(duration: 2.0)) {
                    position = CGPoint(
                        x: CGFloat.random(in: 50...(areaSize.width - 100)),
                        y: CGFloat.random(in: 50...(areaSize.height - 100))
                    )
                    
//                    print(position.x, position.y)
                }
            }
        }
    }
    
    private func stopMoving() {
        movementTimer?.invalidate()
        movementTimer = nil
    }
}

#Preview {
    GameBiologyView(
        biology: Biology(
            type: .anchovy,
            position: CGPoint(x: CGFloat.random(in: 50...500), y: CGFloat.random(in: 50...500))
        ),
        areaSize: .constant(CGSize(width: 1150, height: 606)),
        onTap: {}
    )
}
