//
//  SwiftUIView.swift
//  MicroPlastic Tracker
//
//  Created by 李柏霖 on 2025/2/11.
//

import SwiftUI

struct MuseumView: View {
    
    @EnvironmentObject private var gameService: GameService
    
    let biology: [BiologyInfo] = [
        salp, northernPrawn, anchovy,
        skipjackTuna, atlanticBluefineTuna, human
    ]
    
    let firstIntro: Bool
    
    var body: some View {
        ZStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .center, spacing: 180) {
                    ForEach(biology, id: \.self) {bio in
                        if let index = gameService.collectedBiology.firstIndex(where: {
                            $0.type == bio.type
                        }) {
                            BiologyView(
                                enabled: !firstIntro ? $gameService.collectedBiology[index].enabled: .constant(false),
                                microplastic: $gameService.collectedMicroplastic,
                                biology: bio,
                                firstIntro: firstIntro
                            )
                            .padding(.top, firstIntro ? 10 : 80)
                            
                            if index != gameService.collectedBiology.count - 1 {
                                Image(systemName: "arrowshape.right.fill")
                                    .font(.system(size: 80))
                            }
                        }
                    }
                    
                    Spacer()
                        .frame(width: 50)
                }
                .padding(.horizontal, 50)
            }
            
            if !firstIntro {
                VStack {
                    HStack(alignment: .bottom, spacing: 30) {
                        
                        Spacer()
                        
                        Image(microbeads.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 60)
                        
                        Text("\(gameService.collectedMicroplastic.microbeads)")
                            .font(.largeTitle)
                        
                        Image(microfibers.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 60)
                        
                        Text("\(gameService.collectedMicroplastic.microbeads)")
                            .font(.largeTitle)
                        
                        Image(microfragments.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 60)
                        
                        Text("\(gameService.collectedMicroplastic.microfragments)")
                            .font(.largeTitle)
                    }
                    .monospaced()
                    .padding(.horizontal, 30)
                    
                    Spacer()
                    
                }
            }
        }
    }
}

#Preview {
    MuseumView(firstIntro: true)
        .environmentObject(GameService())
}

