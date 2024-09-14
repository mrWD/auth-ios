//
//  HomeView.swift
//  auth
//
//  Created by Viktor Lavrov on 14.09.24.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var appRootManager: AppRootManager
    
    var body: some View {
        ZStack {
            Color.orange
                .ignoresSafeArea()
            
            VStack(alignment: .trailing) {
                HStack {
                    Spacer()
                    Button {
                        appRootManager.currentRoot = .authentication
                    } label: {
                        Text("Logout")
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                    }
                }
                Spacer()
            }
            .padding(.trailing)
            
            Text("Welcome Home")
                .font(.title)
                .fontWeight(.semibold)
                .foregroundColor(.white)
        }
    }
}

#Preview {
    HomeView()
}
