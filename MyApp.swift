import SwiftUI

@main
struct MyApp: App {
    
    @StateObject private var gameService: GameService = GameService()
    var body: some Scene {
        WindowGroup {
            StartView()
                .environmentObject(gameService)
        }
    }
}
