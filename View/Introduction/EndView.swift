//
//  EndView.swift
//  MicroPlastic Tracker
//
//  Created by 李柏霖 on 2025/2/16.
//

import SwiftUI
import UIKit

struct EndView: View {
    @EnvironmentObject var gameService: GameService
    var body: some View {
        ZStack {
            Image("coverImage")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Text("Thank you for playing~~")
                    .font(.system(size: 50))
                    .foregroundStyle(Color("textColor"))
                    .padding(.top, 250)
                
                Spacer()
                
                NavigationLink {
                    GameView()
                } label: {
                    Text("Play Again")
                        .foregroundStyle(Color("textColor"))
                        .font(.largeTitle)
                        .padding(20)
                        .frame(width: 270)
                        .background(Color("ButtonColor"))
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .shadow(radius: 10)
                        .padding(.top, 150)
                }
                .onTapGesture {
                    gameService.resetGame()
                }
                
                Spacer()
            }
        }
        .monospaced()
    }
}

#Preview {
    EndView()
        .environmentObject(GameService())
}
