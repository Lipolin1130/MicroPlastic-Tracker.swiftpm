//
//  GuideView.swift
//  MicroPlastic Tracker
//
//  Created by 李柏霖 on 2025/2/16.
//

import SwiftUI

struct GuideView: View {
    var body: some View {
        VStack {
            ZStack {
                NavigationLink {
                    MicroplasticIntroView()
                } label: {
                    
                    Image("microplasticFishEat")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300)
                        .overlay {
                            
                        }
                }
            }
            .padding(.bottom, 150)
        }
    }
    
//    private func generateDots() {
//        dots = (0..<10).map { _ in
//            let randomX = CGFloat.random(in: size.width * 0.3...size.width * 0.7) // 讓圓點落在圖片區域內
//            let randomY = CGFloat.random(in: size.height * 0.3...size.height * 0.6)
//            return (randomX, randomY)
//        }
//    }
}

#Preview {
    GuideView()
}
