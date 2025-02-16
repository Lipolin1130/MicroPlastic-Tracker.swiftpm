//
//  BiologyView.swift
//  MicroPlastic Tracker
//
//  Created by 李柏霖 on 2025/2/12.
//

import SwiftUI

struct BiologyView: View {
    @EnvironmentObject var gameService: GameService
    @Binding var enabled: Bool
    @Binding var microplastic: Microplastic
    @State var showSheet = false
    @State private var timer: Timer?
    @State private var isUnlocking = false
    
    let biology: BiologyInfo
    let firstIntro: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(biology.torphicLevel.rawValue)
                .font(.largeTitle)
                .padding(.bottom, 30)
            
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 30)
                    .fill(Color.gray.opacity(0.3))
                    .frame(width: 550, height: 225)
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
                                let textArray = Array(enabled ? biology.introduction : Utilities.randomString(changeLetter: biology.introduction))
                                let maxCharsPerLine = 45
                                let totalLines = (textArray.count + maxCharsPerLine - 1) / maxCharsPerLine
                                
                                ForEach(0..<totalLines, id: \.self) { lineIndex in
                                    let startIndex = lineIndex * maxCharsPerLine
                                    let endIndex = min(startIndex + maxCharsPerLine, textArray.count)
                                    let lineCharacters = Array(textArray[startIndex..<endIndex])
                                    
                                    HStack(spacing: 0) {
                                        ForEach(Array(lineCharacters.enumerated()), id: \.offset) { index, letter in
                                            Text(String(letter))
                                                .monospaced()
                                                .font(.subheadline)
                                                .opacity(enabled ? 1 : 0.5)
                                                .animation(.easeInOut(duration: 0.5).delay(Double(index) / 40.0), value: enabled)
                                        }
                                    }
                                }
                            }
                            
                            HStack {
                                Spacer()
                                
                                Button {
                                    if enabled {
                                        showSheet.toggle()
                                    }
                                } label: {
                                    Text("See more...")
                                        .underline()
                                }
                            }
                        }
                        .padding(.vertical, 10)
                        .frame(width: 400, height: 225)
                        .offset(x: 55)
                    }
                    .offset(x: 120)
                
                Circle()
                    .fill(Color.gray)
                    .frame(width: 225, height: 225)
                    .overlay {
                        Image(biology.type.imageName())
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
                        
                        Text("\(biology.microplastic.microbeads)")
                            .font(.title3)
                        
                        Image(microfibers.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 40)
                        
                        Text("\(biology.microplastic.microbeads)")
                            .font(.title3)
                        
                        Image(microfragments.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 40)
                        
                        Text("\(biology.microplastic.microfragments)")
                            .font(.title3)
                    }
                    .padding(.trailing, 20)
                    
                    Button {
                        if unLock(need: biology.microplastic, got: microplastic) {
                            withAnimation {
                                enabled = true
                            }
                            gameService.collectedMicroplastic.minusMicroplastic(microplastic: biology.microplastic)
                        }
    
                    } label: {
                        Label("UNLOCK", systemImage: isUnlocking ? "lock.open" : "lock")
                            .font(.title2)
                            .padding(10)
                            .background(Color.gray)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                            .foregroundStyle(.white)
                            .frame(width: 140)
                        
                    }
                    .disabled(firstIntro)
                }
                .padding(.vertical, 20)
            }
        }
        .monospaced()
        .padding([.top, .leading, .bottom], 30)
        .frame(width: 700, height: 425, alignment: .topLeading)
        .sheet(isPresented: $showSheet) {
            BiologyDetailView(biology: biology, showSheet: $showSheet)
        }
        .onAppear {
            if unLock(need: biology.microplastic, got: microplastic) {
                startUnlockAnimation()
            }
        }
        .onDisappear {
            stopUnlockAnimation()
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
    
    func startUnlockAnimation() {
        stopUnlockAnimation()
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            DispatchQueue.main.async {
                withAnimation(.easeInOut(duration: 0.3)) {
                    self.isUnlocking.toggle()
                }
            }
        }
    }
    
    func stopUnlockAnimation() {
        timer?.invalidate()
        timer = nil
    }
}

#Preview {
    BiologyView(
        enabled: .constant(false),
        microplastic: .constant(
            Microplastic(microbeads: 0, microfibers: 0, microfragments: 0)
        ),
        biology: human,
        firstIntro: true
    )
    .environmentObject(GameService())
}
