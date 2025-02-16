//
//  TestView.swift
//  MicroPlastic Tracker
//
//  Created by 李柏霖 on 2025/2/16.
//

import SwiftUI

struct TestView: View {
    @State var show = true

    var body: some View {
        ZStack {
            Color.gray.opacity(0.2).ignoresSafeArea()
            
            ZStack {
                Capsule()
                    .frame(width: 160, height: 50)
                    .foregroundStyle(RadialGradient(colors: show ? [.indigo, .white] : [.gray.opacity(0.2)], center: .bottom, startRadius: 40, endRadius: -70))
                    .shadow(color: show ? .indigo : .black, radius: show ? 30: 0, x: 1, y: 3)
                
                Label("Generate", systemImage: "wand.and.starts.inverse").bold()
                    .foregroundStyle(show ? .white :.gray)
                
            }
            .onTapGesture {
                withAnimation {
                    show.toggle()
                }
            }
        }
    }
}

#Preview {
    TestView()
}
