//
//  InputStylesView.swift
//  auth
//
//  Created by Viktor Lavrov on 14.09.24.
//

import SwiftUI

struct ButtonStyles: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.white)
            .frame(width: 300, height: 50)
            .background(.blue)
            .cornerRadius(10)
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}

#Preview {
    Button("Press Me") {
        print("Button pressed!")
    }
    .buttonStyle(ButtonStyles())
}
