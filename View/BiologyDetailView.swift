//
//  BiologyView.swift
//  MicroPlastic Tracker
//
//  Created by 李柏霖 on 2025/2/12.
//

import SwiftUI

struct BiologyDetailView: View {
    
    let biology: BiologyInfo
    @Binding var showSheet: Bool
    
    var body: some View {
        ScrollView {
            ZStack {
                VStack(alignment: .center, spacing: 15) {
                    Image(biology.type.imageName())
                        .resizable()
                        .scaledToFit()
                        .frame(height: 400)
                    
                    Text(biology.type.rawValue)
                        .font(.largeTitle)
                        .textCase(.uppercase)
                    
                    Text(biology.scientificName)
                        .font(.title2)
                        .italic()
                        .bold()
                    
                    HStack(spacing: 15) {
                        Image(microfragments.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 35)
                        Text("\(biology.microplastic.microfragments)")
                        
                        Image(microfibers.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 35)
                        Text("\(biology.microplastic.microfibers)")
                        
                        Image(microbeads.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 35)
                        Text("\(biology.microplastic.microbeads)")
                        
                        Text("/")
                            .font(.largeTitle)
                        
                        Image(biology.type.imageName())
                            .resizable()
                            .scaledToFit()
                            .frame(height: 50)
                    }
                    
                    VStack (alignment: .leading, spacing: 20){
                        Text(biology.introduction)
                        
                        Text(biology.characteristics)
                        
                        Text(biology.habitat)
                    }
                }
                
                VStack {
                    HStack {
                        VStack(alignment: .leading, spacing: 10) {
                            Text(biology.torphicLevel.rawValue)
                                .bold()
                                .font(.title3)
                        }
                        
                        Spacer()
                        Button {
                            showSheet.toggle()
                        } label: {
                            Image(systemName: "xmark.circle.fill")
                                .font(.title)
                        }
                    }
                    Spacer()
                }
            }
            .monospaced()
            .frame(width: 600)
        }
        .padding(30)
    }
}

#Preview {
    BiologyDetailView(biology: northernPrawn, showSheet: .constant(false))
}
