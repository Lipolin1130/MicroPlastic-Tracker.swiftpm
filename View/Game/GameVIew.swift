import SwiftUI

struct GameView: View {
    
    @EnvironmentObject var gameService: GameService
    @State private var playingAreaSize: CGSize = .zero
    @State private var showSheet = false
    @State private var blink = false
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                HStack(alignment: .center) {
                    NavigationLink {
                        GoalView(getFromSheet: true)
                    } label: {
                        Image(systemName: "questionmark.circle")
                            .foregroundStyle(.white.opacity(0.8))
                    }
                    
                    Spacer()
                    
                    HStack(spacing: 20) {
                        GameTarget(target: gameService.targetMicroplastic.microbeads, get: gameService.collectedMicroplastic.microbeads, imageName: microbeads.imageName)
                        
                        GameTarget(target: gameService.targetMicroplastic.microfibers, get: gameService.collectedMicroplastic.microfibers, imageName: microfibers.imageName)
                        
                        GameTarget(target: gameService.targetMicroplastic.microfragments, get: gameService.collectedMicroplastic.microfragments, imageName: microfragments.imageName)
                    }
                    .opacity(0.8)
                    
                    Spacer()
                    
                    NavigationLink {
                        MuseumView(firstIntro: false)
                    } label: {
                        Image(systemName: "books.vertical")
                            .foregroundStyle(.white.opacity(0.8))
                            .scaleEffect(blink ? 1.2 : 1)
                            .animation(gameService.newBiologyUnlocked ?
                                .easeInOut(duration: 0.8).repeatForever(autoreverses: true):
                                .default,
                                value: blink
                            )
                    }
                    .onChange(of: gameService.newBiologyUnlocked) {newValue in
                        blink = newValue
                    }
                }
                .font(.system(size: 60))
                .monospaced()
                .frame(height: 80, alignment: .top)
                
                GeometryReader { geometry in // Playing Area
                    let safeHeight = max(geometry.size.height - geometry.safeAreaInsets.bottom - 80, 500)
                    let newSize = CGSize(width: geometry.size.width, height: safeHeight)
                    
                    VStack {
                        ForEach(gameService.spawnedBiology, id: \.id) { biology in
                            if playingAreaSize.width > 0 && playingAreaSize.height > 0 {
                                GameBiologyView(biology: biology, areaSize: $playingAreaSize) {
                                    Task {
                                        await gameService.collectBiology(biology: biology)
                                    }
                                }
                            }
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .onAppear {
                        DispatchQueue.main.async {
                            playingAreaSize = newSize
                        }
                    }
                }
            }
            .padding(30)
            
            if gameService.completed {
                HStack {
                    VStack {
                        Spacer()
                        
                        NavigationLink {
                            RewardView()
                        } label: {
                            Text("Next")
                                .foregroundStyle(Color("textColor"))
                                .font(.title2)
                                .bold()
                                .padding(18)
                                .frame(width: 120)
                                .background(Color("ButtonColor"))
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                                .shadow(radius: 10)
                                .padding(.bottom, 25)
                        }
                    }
                }
            }
            
            if gameService.newBiologyUnlocked {
                Text("New Organism Available for Unlock!")
                    .font(.title3)
                    .bold()
                    .padding()
                    .background(Color.black.opacity(0.8))
                    .foregroundStyle(.white)
                    .cornerRadius(10)
                    .transition(.opacity)
                    .animation(.easeInOut, value: gameService.newBiologyUnlocked)
                    .padding(.bottom, 450)
            }
        }
        .monospaced()
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    GameView()
        .environmentObject(GameService())
}
