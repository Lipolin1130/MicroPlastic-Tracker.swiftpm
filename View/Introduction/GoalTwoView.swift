//
//  GoalTwoView.swift
//  MicroPlastic Tracker
//
//  Created by 李柏霖 on 2025/2/20.
//

import SwiftUI

struct GoalTwoView: View {
    @EnvironmentObject var gameService: GameService
    let getFromSheet: Bool
    
    var body: some View {
        VStack(alignment: .center) {
            HStack(spacing: 40) {
                Text("As you collect microplastics, you can unlock new marine organisms in the Museum.\nDifferent organisms contain different amounts of microplastics.")
                    .font(.title2)
                    .padding(20)
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color("ButtonColor"))
                    )
                
                VStack(spacing: 20) {
                    Image(systemName: "books.vertical")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 70)
                    
                    Text("Museum icon")
                        .font(.title2)
                        .bold()
                }
                .foregroundStyle(Color("textColor"))
            }
            
            MuseumView(firstIntro: true)
            
            HStack {
                Spacer()
                NavigationLink {
                    GameView()
                } label: {
                    Text(getFromSheet ? "Back to Game" :"Start Game")
                        .foregroundStyle(Color("textColor"))
                        .bold()
                        .font(.title2)
                        .padding(18)
                        .frame(width: getFromSheet ? 250 : 180)
                        .background(Color("ButtonColor"))
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .shadow(radius: 10)
                }
            }
        }
        .monospaced()
        .padding(30)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    GoalTwoView(getFromSheet: false)
        .environmentObject(GameService())
}
