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
        VStack(alignment: .center, spacing: 20) {
            Text("Congratulations!")
                .font(.system(size: 50))
                .bold()
            
            Text("You have collected these marine organisms!")
                .font(.title)
            
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
            
            HStack(alignment: .center, spacing: 30) {
                
                VStack {
                    Image(microfragments.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 125)
                    
                    Text(microfragments.imageName)
                        .italic()
                }
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Total Microplastics Collected: ") +
                    Text("\(gameService.collectedMicroplastic.addAll())").bold().italic() +
                    Text(" µg")
                    
                    
                    Text("Tap ") +
                    Text("\"Next\"").bold() +
                    Text(" to see how microplastics accmulate through the food chain.")
                }
                .font(.title2)
                .padding()
                .background {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color("ButtonColor"))
                }
                
                NavigationLink {
                    EndView()
                } label: {
                    Text("Next")
                        .foregroundStyle(Color("ButtonColor"))
                        .bold()
                        .font(.title2)
                        .padding(18)
                        .frame(width: 120)
                        .background(Color.indigo)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .shadow(radius: 10)
                }
                .padding([.leading, .top], 80)
                   
            }
            .padding(.top, 10)
        }
        .padding(20)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .monospaced()
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    RewardView()
        .environmentObject(GameService())
}
