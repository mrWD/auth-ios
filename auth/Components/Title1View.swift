//
//  SwiftUIView.swift
//  auth
//
//  Created by Viktor Lavrov on 14.09.24.
//

import SwiftUI

struct Title1View: View {
    @State var text: String = ""

    var body: some View {
        Text(text)
            .font(.largeTitle)
            .bold()
            .padding()
    }
}

#Preview {
    Title1View()
}
