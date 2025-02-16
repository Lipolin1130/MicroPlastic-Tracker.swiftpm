//
//  MuseumIntroView.swift
//  MicroPlastic Tracker
//
//  Created by 李柏霖 on 2025/2/15.
//

import SwiftUI

struct GoalView: View {
    
    @EnvironmentObject var gameService: GameService
    var getFromSheet: Bool
    
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
                
                VStack(alignment: .leading) {
                    Text("Your Goal: ")
                        .font(.title2)
                        .bold()
                    
                    Text(goalText)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color("ButtonColor"))
                        )
                        .frame(maxWidth: 500)
                }
                VStack(alignment: .center) {
                    Text("Collection Target:")
                        .font(.title2)
                        .bold()
                    
                    HStack(spacing: 30) {
                        VStack(spacing: 15) {
                            Image(microfragments.imageName)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 60)
                            
                            Text("5000")
                                .font(.title3)
                        }
                        
                        VStack(spacing: 15) {
                            Image(microfibers.imageName)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 60)
                            
                            Text("5000")
                                .font(.title3)
                        }
                        
                        VStack(spacing: 15) {
                            Image(microbeads.imageName)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 60)
                            
                            Text("5000")
                                .font(.title3)
                        }
                    }
                }
            }
            .padding([.horizontal], 30)
            
            MuseumView(firstIntro: true)
                
            
            if !getFromSheet {
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
                            .shadow(radius: 10)
                    }
                }
            }
        }
        .monospaced()
        .padding([.horizontal, .bottom], 30)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    GoalView(getFromSheet: true)
        .environmentObject(GameService())
}
