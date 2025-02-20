//
//  GoalOneView.swift
//  MicroPlastic Tracker
//
//  Created by 李柏霖 on 2025/2/20.
//

import SwiftUI

struct GoalOneView: View {
    @EnvironmentObject var gameService: GameService
    let getFromSheet: Bool
    
    @State private var showHandTap = true
    @State private var tapAnimation = false
    @State private var fishScale: CGFloat = 1.0
    
    var body: some View {
        VStack(alignment: .center, spacing: 50) {
            HStack {
                Text("Your Goal")
                    .font(.system(size: 50))
                    .bold()
                
                Spacer()
            }
            VStack {
                Text("Collect") +
                Text(" 5,000 microfragments, 5,000 microfibers, and 5,000 microbeads").bold() +
                Text(" by catching different marine organisms!")
            }
            .font(.title)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(30)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color("ButtonColor"))
            )
            
            HStack(alignment: .bottom, spacing: 80) {
                VStack(spacing: 15) {
                    Image(microfragments.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 150)
                    
                    Text("\(gameService.targetMicroplastic.microfragments)")
                        .font(.largeTitle)
                }
                
                VStack(spacing: 15) {
                    Image(microfibers.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 150)
                    
                    Text("\(gameService.targetMicroplastic.microfibers)")
                        .font(.largeTitle)
                }
                
                VStack(spacing: 15) {
                    Image(microbeads.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 150)
                    
                    Text("\(gameService.targetMicroplastic.microbeads)")
                        .font(.largeTitle)
                }
                VStack(spacing: 50) {
                    ZStack {
                        Button {
                            withAnimation(.easeInOut(duration: 0.2)) {
                                fishScale = 1.2
                            }
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                withAnimation(.easeInOut(duration: 0.2)) {
                                    fishScale = 1.0
                                    showHandTap = false
                                }
                            }
                        } label: {
                            Image(systemName: "fish")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100)
                                .foregroundStyle(Color("textColor"))
                                .scaleEffect(fishScale)
                        }
                        
                        if showHandTap {
                            Image(systemName: "hand.tap")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30)
                                .offset(x: 0, y: 30)
                                .foregroundStyle(.black.opacity(0.8))
                                .scaleEffect(tapAnimation ? 1.5 : 1 )
                                .animation(
                                    .easeInOut(duration: 0.8).repeatForever(autoreverses: true),
                                    value: tapAnimation
                                )
                            
                        }
                    }
                    .onAppear {
                        tapAnimation = true
                    }
                    
                    Text("Hint: Tap to collect")
                        .font(.title2)
                        .foregroundStyle(Color("textColor"))
                        .bold()
                }
                
            }
            HStack {
                Spacer()
                NavigationLink {
                    GoalTwoView(getFromSheet: getFromSheet)
                } label: {
                    Text("Next")
                        .foregroundStyle(Color("textColor"))
                        .bold()
                        .font(.title2)
                        .padding(18)
                        .frame(width: 120)
                        .background(Color("ButtonColor"))
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .shadow(radius: 10)
                }
            }
        }
        .monospaced()
        .padding(50)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    GoalOneView(getFromSheet: false)
        .environmentObject(GameService())
}
