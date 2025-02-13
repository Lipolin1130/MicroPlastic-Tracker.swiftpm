import SwiftUI

@main
struct MyApp: App {
    
    @StateObject private var playerData: PlayerData = PlayerData()
    var body: some Scene {
        WindowGroup {
            StartView()
                .environmentObject(playerData)
        }
    }
}
