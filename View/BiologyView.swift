//
//  BiologyView.swift
//  MicroPlastic Tracker
//
//  Created by 李柏霖 on 2025/2/12.
//

import SwiftUI

struct BiologyView: View {
    @Binding var enabled: Bool
    @Binding var microplastic: Microplastic
    let biology: BiologyInfo
    @State var showSheet = false
    //    @State private var animationProgress = 0.0
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(biology.torphicLevel.rawValue)
                .font(.largeTitle)
                .padding(.bottom, 30)
            
            ZStack(alignment: .leading) {
                
                RoundedRectangle(cornerRadius: 30)
                    .fill(Color.gray.opacity(0.3))
                    .frame(width: 500, height: 225)
                    .overlay {
                        VStack(alignment: .leading, spacing: 10) {
                            HStack(spacing: 0) {
                                ForEach(Array((enabled ? biology.type.rawValue : Utilities.randomString(changeLetter: biology.type.rawValue)).enumerated()), id: \.offset) {index, letter in
                                    Text(String(letter))
                                        .font(.title3)
                                        .textCase(.uppercase)
                                        .opacity(enabled ? 1 : 0.5)
                                        .animation(.easeInOut(duration: 2).delay(Double(index / 20)), value: enabled)
                                }
                            }
                            
                            HStack(spacing: 0) {
                                ForEach(Array((enabled ? biology.scientificName : Utilities.randomString(changeLetter: biology.scientificName)).enumerated()), id: \.offset) {index, letter in
                                    Text(String(letter))
                                        .bold()
                                        .italic()
                                        .font(.callout)
                                        .opacity(enabled ? 1 : 0.5)
                                        .animation(.easeInOut(duration: 2).delay(Double(index / 20)), value: enabled)
                                }
                            }
                            
                            LazyVStack(alignment: .leading, spacing: 0) {
                                let textArray = Array((enabled ? biology.introduction : Utilities.randomString(changeLetter: biology.introduction)))
                                let maxCharsPerLine = 35
                                
                                ForEach(0..<(textArray.count / maxCharsPerLine + 1), id: \.self) { lineIndex in
                                    HStack(spacing: 0) {
                                        ForEach(textArray[lineIndex * maxCharsPerLine..<min((lineIndex + 1) * maxCharsPerLine, textArray.count)], id: \.self) { letter in
                                            Text(String(letter))
                                                .monospaced()
                                                .font(.subheadline)
                                                .opacity(enabled ? 1 : 0.5)
                                                .animation(.easeInOut(duration: 2), value: enabled)
                                        }
                                    }
                                }
                            }
                            
                            HStack {
                                Spacer()
                                
                                Button {
                                    if enabled {
                                        showSheet.toggle()
                                    } else {
                                        //TODO: show alert
                                    }
                                } label: {
                                    Text("See more...")
                                        .underline()
                                }
                            }
                        }
                        .padding(.vertical, 10)
                        .frame(width: 380, height: 225)
                        .offset(x: 55)
                    }
                    .offset(x: 120)
                
                Circle()
                    .fill(Color.gray)
                    .frame(width: 225, height: 225)
                    .overlay {
                        Image(biology.imageName)
                            .resizable()
                            .shilhouette(enabled: enabled)
                            .scaledToFit()
                            .frame(width: 165)
                            .padding()
                    }
            }
            
            if !enabled {
                HStack {
                    Spacer()
                    
                    HStack(alignment: .center, spacing: 16) {
                        Image(microbeads.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 40)
                        
                        Text("\(biology.microplastic.microbeads, specifier: "%.1f")")
                            .font(.title3)
                        
                        Image(microfibers.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 40)
                        
                        Text("\(biology.microplastic.microbeads, specifier: "%.1f")")
                            .font(.title3)
                        
                        Image(microfragments.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 40)
                        
                        Text("\(biology.microplastic.microfragments, specifier: "%.1f")")
                            .font(.title3)
                    }
                    .padding(.trailing, 20)
                    
                    Button {
                        if unLock(need: biology.microplastic, got: microplastic) {
                            withAnimation {
                                enabled = true
                            }
                            
                        } else {
                            //TODO: show alert
                        }
                    } label: {
                        Label("Unlock", systemImage: "lock")
                            .font(.title2)
                            .padding(10)
                            .background(Color.gray)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                            .foregroundStyle(.white)
                    }
                }
                .padding(.vertical, 20)
            }
        }
        .monospaced()
        .padding([.top, .leading, .bottom], 30)
        .frame(width: 650, height: 500, alignment: .topLeading)
        .sheet(isPresented: $showSheet) {
            BiologyDetailView(biology: biology, showSheet: $showSheet)
        }
    }
    
    func unLock(need: Microplastic, got: Microplastic) -> Bool {
        if got.microbeads >= need.microbeads &&
            got.microfibers >= need.microfibers &&
            got.microfragments >= need.microfragments {
            return true
        } else {
            return false
        }
    }
}

#Preview {
    BiologyView(
        enabled: .constant(false),
        microplastic: .constant(Microplastic(content: 0)),
        biology: human
    )
}
