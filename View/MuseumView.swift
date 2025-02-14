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
    
    var body: some View {
        ZStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .center, spacing: 180) {
                    ForEach(biology, id: \.self) {bio in
                        if let index = gameService.collectedBiology.firstIndex(where: {
                            $0.type == bio.type
                        }) {
                            BiologyView(
                                enabled: $gameService.collectedBiology[index].enabled,
                                microplastic: $gameService.collectedMicroplastic,
                                biology: bio
                            )
                            .padding(.top, 80)
                            
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
            
            VStack {
                HStack(alignment: .bottom, spacing: 30) {
                    
                    Spacer()
                    
                    Image(microbeads.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 60)
                    
                    Text("\(gameService.collectedMicroplastic.microbeads, specifier: "%.1f")")
                        .font(.largeTitle)
                    
                    Image(microfibers.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 60)
                    
                    Text("\(gameService.collectedMicroplastic.microbeads, specifier: "%.1f")")
                        .font(.largeTitle)
                    
                    Image(microfragments.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 60)
                    
                    Text("\(gameService.collectedMicroplastic.microfragments, specifier: "%.1f")")
                        .font(.largeTitle)
                }
                .monospaced()
                .padding(.horizontal, 30)
                
                Spacer()
                
            }
        }
        .onAppear {
            gameService.collectedMicroplastic = Microplastic(
                microbeads: 2000,
                microfibers: 2000,
                microfragments: 2000
            )
        }
    }
}

#Preview {
    MuseumView()
        .environmentObject(GameService())
}

