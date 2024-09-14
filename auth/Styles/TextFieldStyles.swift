//
//  TextFieldStyles.swift
//  auth
//
//  Created by Viktor Lavrov on 14.09.24.
//

import SwiftUI

struct TextFieldStyles: TextFieldStyle {
    @State var icon: Image?
    @Binding var state: Int
    
    func _body(configuration: TextField<Self._Label>) -> some View {
        HStack {
            if icon != nil {
                icon
                    .foregroundColor(Color(UIColor.systemGray4))
            }
            configuration
        }
        .padding()
        .frame(width: 300, height: 50)
        .background(.black.opacity(0.05))
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(.red, lineWidth: CGFloat(state))
        )
    }
}

#Preview {
    VStack {
        TextField("Test", text: .constant(""))
            .textFieldStyle(TextFieldStyles(
                icon: Image(systemName: "lock"),
                state: .constant(0)
            ))

        TextField("Test", text: .constant(""))
            .textFieldStyle(TextFieldStyles(
                icon: Image(systemName: "lock"),
                state: .constant(2)
            ))
    }
}
