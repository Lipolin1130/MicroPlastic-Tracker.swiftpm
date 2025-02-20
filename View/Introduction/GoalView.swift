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
                    Text("Collect microplastics by catching different marine organisms. ") +
                    Text("Each organism contains different amounts of microplastics!")
                    HStack(alignment: .bottom) {
                        Text("You can unlock new organisms in the")
                            .bold()
                        
                        Image(systemName: "books.vertical")
                            .font(.title2)
                    }
                    Text("at the top right corner.")
                        .bold()
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color("ButtonColor"))
                )
                .frame(alignment: .leading)
                
                VStack(alignment: .leading) {
                    Text("Your Goal:")
                        .font(.title2)
                        .bold()
                    
                    HStack(spacing: 30) {
                        VStack(spacing: 15) {
                            Image(microfragments.imageName)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 85)
                            
                            Text("\(gameService.targetMicroplastic.microfragments)")
                                .font(.title3)
                        }
                        
                        VStack(spacing: 15) {
                            Image(microfibers.imageName)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 85)
                            
                            Text("\(gameService.targetMicroplastic.microfibers)")
                                .font(.title3)
                        }
                        
                        VStack(spacing: 15) {
                            Image(microbeads.imageName)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 85)
                            
                            Text("\(gameService.targetMicroplastic.microbeads)")
                                .font(.title3)
                        }
                    }
                }
            }
            .padding([.horizontal], 30)
            
            MuseumView(firstIntro: true)
            
            
            if !getFromSheet {
                HStack {
                    
                    VStack(alignment: .leading) {
                        Text("Collect enough microplastics to unlock new organisms!")
                        Text("Different organisms contain different amounts of microplastics.")
                    }
                    .font(.callout)
                    .monospaced()
                    .padding(.leading, 50)
                    
                    
                    Spacer()
                    
                    NavigationLink {
                        GameView()
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
        }
        .monospaced()
        .padding([.horizontal, .bottom], 30)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    GoalView(getFromSheet: false)
        .environmentObject(GameService())
}
