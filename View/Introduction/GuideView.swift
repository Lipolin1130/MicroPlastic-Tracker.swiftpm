//
//  GuideView.swift
//  MicroPlastic Tracker
//
//  Created by 李柏霖 on 2025/2/16.
//

import SwiftUI

struct GuideView: View {
    @State private var dots: [(position: CGPoint, color: Color)] = []
    @State private var showNotification = false
    @State private var timer: Timer?
    
    var body: some View {
        VStack {
            ZStack {
                GeometryReader { geometry in
                    Image("microplasticFishEat")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 400)
                        .overlay {
                            ZStack {
                                ForEach(0..<50, id: \.self) { index in
                                    if dots.indices.contains(index) {
                                        AnimationDot(position: dots[index].position, color: dots[index].color)
                                            .onTapGesture {
                                                timer?.invalidate()
                                                timer = nil
                                            }
                                    }
                                }
                            }
                        }
                        .onAppear {
                            generateDots(in: geometry.size)
                            startTimer()
                        }
                }
                .frame(width: 400, height: 400)
                .padding(.bottom, 150)
                
                VStack {
                    Spacer()
                    
                    if showNotification {
                        Text("Tap the dots")
                            .font(.title2)
                            .bold()
                            .padding()
                            .background(Color.black.opacity(0.8))
                            .foregroundStyle(.white)
                            .cornerRadius(10)
                            .transition(.opacity)
                            .animation(.easeInOut, value: showNotification)
                    }
                }
                .padding(.bottom, 100)
            }
        }
    }
    
    private func generateDots(in size: CGSize) {
        let colors: [Color] = [.blue, .yellow, .green, .indigo, .orange, .pink, .purple, .red, .teal]
        
        dots = (0..<50).map { _ in
            let randomX = CGFloat.random(in: size.width * 0.2...size.width * 0.85)
            let randomY = CGFloat.random(in: size.height * 0.4...size.height * 0.85)
            let randomColor = colors.randomElement() ?? .blue
            return (CGPoint(x: randomX, y: randomY), randomColor)
        }
    }
    
    private func startTimer() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 8, repeats: false) {_ in
            DispatchQueue.main.async {
                withAnimation {
                    showNotification = true
                }
            }
        }
    }
}

#Preview {
    GuideView()
}
