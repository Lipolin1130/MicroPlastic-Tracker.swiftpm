//
//  RewardView.swift
//  MicroPlastic Tracker
//
//  Created by 李柏霖 on 2025/2/15.
//

import SwiftUI

struct RewardView: View {
    @EnvironmentObject var gameService: GameService
    var body: some View {
        VStack(alignment: .center, spacing: 40) {
            Text("Congratulations!")
                .font(.system(size: 50))
                .bold()
            
            HStack(alignment: .center, spacing: 70) {
                RewardSingleView(biology: gameService.collectedBiology[0])
                RewardSingleView(biology: gameService.collectedBiology[1])
                RewardSingleView(biology: gameService.collectedBiology[2])
            }
            
            HStack(alignment: .center, spacing: 70) {
                RewardSingleView(biology: gameService.collectedBiology[3])
                RewardSingleView(biology: gameService.collectedBiology[4])
                RewardSingleView(biology: gameService.collectedBiology[5])
            }
            
            HStack(alignment: .bottom, spacing: 30) {
                
                Spacer()
                
                VStack {
                    Image(microfragments.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 125)
                    
                    Text(microfragments.imageName)
                        .italic()
                }
                
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color("ButtonColor"))
      
                    Text("\(gameService.collectedMicroplastic.addAll())")
                        .font(.title2)
                        .bold()
                        .italic()
                }
                .frame(width: 550, height: 150)
                
                Spacer()
                
                NavigationLink {
                    //nextView
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
            .padding([.top, .bottom], 10)
        }
        .padding(20)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .monospaced()
    }
}

#Preview {
    RewardView()
        .environmentObject(GameService())
}
