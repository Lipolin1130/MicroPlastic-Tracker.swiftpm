//
//  MuseumIntroView.swift
//  MicroPlastic Tracker
//
//  Created by 李柏霖 on 2025/2/15.
//

import SwiftUI

struct GoalView: View {
    
    @EnvironmentObject var gameService: GameService
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .center, spacing: 40) {
                VStack {
                    Image(microbeads.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 150)
                    
                    Text("\(microbeads.name)")
                        .font(.title2)
                        .italic()
                }
                
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color("ButtonColor"))
                    
                    Text("\(microbeads.introduction)")
                        .font(.title2)
                }
                .frame(width: 600, height: 150)
                
                HStack(spacing: 30) {
                    VStack(spacing: 15) {
                        Image(microfragments.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 80)
                        
                        Text("2000")
                            .font(.title2)
                    }
                    
                    VStack(spacing: 15) {
                        Image(microfibers.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 80)
                        
                        Text("2000")
                            .font(.title2)
                    }
                    
                    VStack(spacing: 15) {
                        Image(microbeads.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 80)
                        
                        Text("2000")
                            .font(.title2)
                    }
                }
            }
            .padding([.horizontal], 30)
            
            MuseumView(firstIntro: true)
            
            HStack {
                Spacer()
                
                NavigationLink {
                    GameView()
                } label: {
                    Text("Next")
                        .foregroundStyle(Color("textColor"))
                        .font(.title2)
                        .padding(18)
                        .frame(width: 120)
                        .background(Color("ButtonColor"))
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                }
            }
        }
        .monospaced()
        .padding([.horizontal, .bottom], 30)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    GoalView()
        .environmentObject(GameService())
}
