//
//  MicroplasticIntroView.swift
//  MicroPlastic Tracker
//
//  Created by 李柏霖 on 2025/2/15.
//

import SwiftUI

struct MicroplasticIntroView: View {
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 20) {
                HStack(alignment: .top, spacing: 50) {
                    VStack(spacing: 10) {
                        Image(microfragments.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 150)
                        
                        Text("\(microfragments.name)")
                            .font(.title2)
                            .italic()
                    }
                    ZStack {
                        RoundedRectangle(cornerRadius: 25)
                            .fill(Color("ButtonColor"))
                        
                        Text(microfragments.introduction)
                            .font(.title2)
                    }
                }
                .padding()
                .frame(maxWidth: .infinity)
                
                
                HStack(alignment: .top, spacing: 50) {
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 25)
                            .fill(Color("ButtonColor"))
                        
                        Text(microbeads.introduction)
                            .font(.title2)
                    }
                    
                    VStack(spacing: 10) {
                        Image(microbeads.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 150)
                        Text("\(microbeads.name)")
                            .font(.title2)
                            .italic()
                    }
                }
                .padding()
                .frame(maxWidth: .infinity)
                
                HStack(alignment: .top, spacing: 50) {
                    VStack(spacing: 10) {
                        Image(microfibers.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 150)
                        
                        Text("\(microfibers.name)")
                            .font(.title2)
                            .italic()
                    }
                    ZStack {
                        RoundedRectangle(cornerRadius: 25)
                            .fill(Color("ButtonColor"))
                        
                        Text(microfibers.introduction)
                            .font(.title2)
                    }
                }
                .padding()
                .frame(maxWidth: .infinity)
            }
            .padding([.horizontal, .bottom], 60)
            
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    NavigationLink {
                        GoalView()
                    } label: {
                        Text("Next")
                            .foregroundStyle(Color("textColor"))
                            .font(.title2)
                            .padding(18)
                            .frame(width: 120)
                            .background(Color("ButtonColor"))
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                    }
                }
            }
        }
        .monospaced()
        .padding([.horizontal, .bottom], 20)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    MicroplasticIntroView()
}
