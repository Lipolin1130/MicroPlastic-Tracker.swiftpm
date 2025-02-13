//
//  BlendModelSilhouetteView.swift
//  MicroPlastic Tracker
//
//  Created by 李柏霖 on 2025/2/12.
//

import SwiftUI

struct Utilities {
    static func randomString(changeLetter: String, enabled: Bool) -> String {
        if enabled {
            return changeLetter
        } else {
            let letters = "abcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*()-=_+[]{}|;:'\",.<>?/`~"
            
            return String(changeLetter.map { char in
                if char.isWhitespace || char == "\"" {
                    return char
                } else {
                    return letters.randomElement()!
                }
            })
        }
    }
}

extension Image {
    func shilhouette(enabled: Bool) -> some View {
        if enabled {
            return AnyView(self)
        } else {
            return AnyView(
                self
                    .foregroundStyle(.white)
                    .blendMode(.destinationOut)
            )
        }
    }
}
