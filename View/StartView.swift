//
//  StartView.swift
//  MicroPlastic Tracker
//
//  Created by 李柏霖 on 2025/2/11.
//

import SwiftUI

struct StartView: View {
    var body: some View {
        NavigationStack {
            VStack {
                NavigationLink {
                    GameView()
                } label: {
                    Text("Game View")
                }
            }
        }
    }
}

#Preview {
    StartView()
}
