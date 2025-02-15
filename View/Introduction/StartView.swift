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
            ZStack {
                Image("coverImage")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                VStack {
                    Spacer()
                    Text(appTitle)
                        .font(.largeTitle)
                        .padding(.top, 250)
                    
                    Spacer()
                    
                        NavigationLink {
                            MicroplasticIntroView()
                        } label: {
                            Text("Start")//TODO: START animation
                                .foregroundStyle(Color("textColor"))
                                .font(.largeTitle)
                                .padding(20)
                                .background(Color("ButtonColor"))
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                                .frame(width: 200)
                                .padding(.top, 150)
                        }
                    
                    Spacer()
                }
                .monospaced()
            }
        }
    }
}

#Preview {
    StartView()
}
