//
//  MicroplasticIntroView.swift
//  MicroPlastic Tracker
//
//  Created by 李柏霖 on 2025/2/15.
//

import SwiftUI

struct MicroplasticIntroView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 25) {
            HStack(alignment: .top, spacing: 100) {
                VStack(spacing: 10) {
                    Image(microfragments.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 150)
                    
                    Text("\(microfragments.name)")
                        .font(.title2)
                        .italic()
                }
                Text(microfragments.introduction)
                    .font(.title2)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 25)
                            .fill(Color("ButtonColor"))
                    )
            }
            .frame(maxWidth: .infinity)
            
            HStack(alignment: .top, spacing: 100) {
                Text(microbeads.introduction)
                    .font(.title2)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 25)
                            .fill(Color("ButtonColor"))
                    )
                
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
            
            .frame(maxWidth: .infinity)
            
            HStack(alignment: .top, spacing: 100) {
                VStack(spacing: 10) {
                    Image(microfibers.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 150)
                    
                    Text("\(microfibers.name)")
                        .font(.title2)
                        .italic()
                }
                
                Text(microfibers.introduction)
                    .font(.title2)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 25)
                            .fill(Color("ButtonColor"))
                    )
            }
            .frame(maxWidth: .infinity)
            
            HStack {
                Spacer()
                NavigationLink {
//                    GoalView(getFromSheet: false)
                    GoalOneView(getFromSheet: false)
                } label: {
                    Text("Next")
                        .foregroundStyle(Color("textColor"))
                        .bold()
                        .font(.title2)
                        .padding(18)
                        .frame(width: 120)
                        .background(Color("ButtonColor"))
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .shadow(radius: 10)
                }
            }
        }
        .padding(60)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .monospaced()
        .padding(20)
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    MicroplasticIntroView()
}
