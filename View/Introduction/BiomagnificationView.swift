//
//  BiomagnificationView.swift
//  MicroPlastic Tracker
//
//  Created by 李柏霖 on 2025/2/19.
//

import SwiftUI

struct BiomagnificationView: View {
    var body: some View {
        VStack {
            ZStack {
                VStack {
                    VStack(alignment: .leading) {
                        Text("Biomagnification")
                            .font(.system(size: 50))
                        
                        HStack(spacing: 25) {
                            
                            VStack(alignment: .leading) {
                                Text("Biomagnification is the process where pollutants ") +
                                Text("(like microplastics) ").bold() +
                                Text("build up more and more as they move up the food chain.")
                            }
                            .font(.title2)
                            .padding(30)
                            .background(
                                RoundedRectangle(cornerRadius: 25)
                                    .fill(Color("ButtonColor"))
                            )
                            .frame(width: 400)
                            
                            Spacer()
                        }
                        .padding(.top, 20)
                    }
                    
                    Spacer()
                }
                .padding(.top, 20)
                
                HStack {
                    
                    Spacer()
                    
                    Image("biomagnification Pyramid")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 550)
                        .offset(x: 50)
                    
                    HStack(spacing: 0) {
                        Text("Trophic Level")
                            .foregroundStyle(Color("textColor").opacity(0.7))
                            .bold()
                            .fixedSize()
                            .font(.title2)
                            .frame(width: 20)
                            .rotationEffect(.degrees(-90))
                            .offset(x: 30)
                        
                        ArrowShape()
                            .stroke(Color("textColor").opacity(0.7), lineWidth: 3)
                            .frame(width: 75, height: 450)
                            .fixedSize()
                            .offset(x: 15)
                        
                        Text("Microplastic Concentration")
                            .foregroundStyle(Color("textColor").opacity(0.7))
                            .bold()
                            .fixedSize()
                            .font(.title2)
                            .frame(width: 20)
                            .rotationEffect(.degrees(-90))
                    }
                }
            }
            
            HStack {
                Spacer()
                
                NavigationLink {
                    EndView()
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
            .padding([.top, .trailing], 30)
            
        }
        .monospaced()
        .padding(30)
        .frame(width: .infinity, height: .infinity)
    }
}

struct ArrowShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let width = rect.width
        let height = rect.height
        
        let startPoint = CGPoint(x: width * 0.5, y: height)
        let endPoint = CGPoint(x: width * 0.5, y: 0)
        let arrowSize: CGFloat = width * 0.2
        
        let arrowLeft = CGPoint(x: width * 0.5 - arrowSize, y: arrowSize)
        let arrowRight = CGPoint(x: width * 0.5 + arrowSize, y: arrowSize)
        
        path.move(to: startPoint)
        path.addLine(to: endPoint)
        
        path.move(to: endPoint)
        path.addLine(to: arrowLeft)
        
        path.move(to: endPoint)
        path.addLine(to: arrowRight)
        
        return path
    }
}

#Preview {
    BiomagnificationView()
}
