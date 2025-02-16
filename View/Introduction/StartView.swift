//
//  StartView.swift
//  MicroPlastic Tracker
//
//  Created by 李柏霖 on 2025/2/11.
//

import SwiftUI

struct StartView: View {
    @State private var startButton: Bool = false
    @State private var offsetY: CGFloat = 0
    @State private var imageOppacity: Double = 1.0
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image("background")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                Image("coverImage")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                    .offset(y: offsetY)
                    .opacity(imageOppacity)
                    .animation(.easeInOut(duration: 2), value: imageOppacity)
                
                if startButton {
                    GuideView()
                } else {
                    VStack {
                        Spacer()
                        Text(appTitle)
                            .font(.largeTitle)
                            .padding(.top, 250)
                        
                        Spacer()
                        
                        Button {
                            withAnimation(.easeInOut(duration: 2)) {
                                offsetY = -UIScreen.main.bounds.height
                                imageOppacity = 0
                                startButton = true
                            }
                        } label: {
                            Text("Start")
                                .foregroundStyle(Color("textColor"))
                                .font(.largeTitle)
                                .padding(20)
                                .background(Color("ButtonColor"))
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                                .frame(width: 200)
                                .shadow(radius: 10)
                                .padding(.top, 150)
                        }
                        Spacer()
                    }
                }
            }
            .monospaced()
        }
    }
}

#Preview {
    StartView()
}
