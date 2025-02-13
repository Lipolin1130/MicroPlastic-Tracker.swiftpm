import SwiftUI

struct GameView: View {
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .ignoresSafeArea()
            VStack {
                NavigationLink {
                    MuseumView()
                } label: {
                    Text("Open Museum")
                }
            }
        }
    }
}

#Preview {
    GameView()
        .environmentObject(PlayerData())
}
