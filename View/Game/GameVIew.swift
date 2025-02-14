import SwiftUI

struct GameView: View {
    @EnvironmentObject var gameService: GameService
    @State private var playingAreaSize: CGSize = .zero
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                HStack {
                    
                    Image(systemName: "questionmark.circle")
                    
                    Spacer()
                    
                    HStack(spacing: 20) {
                        
                        GameTargetView(target: gameService.targetMicroplastic.microbeads, get: gameService.collectedMicroplastic.microbeads, imageName: microbeads.imageName)
                        
                        GameTargetView(target: gameService.targetMicroplastic.microfibers, get: gameService.collectedMicroplastic.microfibers, imageName: microfibers.imageName)
                        
                        GameTargetView(target: gameService.targetMicroplastic.microfragments, get: gameService.collectedMicroplastic.microfragments, imageName: microfragments.imageName)
                    }
                    
                    Spacer()
                    
                    Image(systemName: "books.vertical")
                    
                }
                .font(.system(size: 60))
                .monospaced()
                .frame(height: 80, alignment: .top)
                
                Spacer()
                
                GeometryReader { geometry in // Playing Area
                    ForEach(gameService.spawnedBiology, id: \.self) { biology in
                        GameBiologyView(biology: biology, areaSize: $playingAreaSize) {
                            gameService.collectBiology(biology: biology)
                        }
                    }
                    .onAppear {
                        playingAreaSize = geometry.size
                        print(playingAreaSize.width, playingAreaSize.height)
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .padding(30)
        }
        
    }
}

#Preview {
    GameView()
        .environmentObject(GameService())
}
