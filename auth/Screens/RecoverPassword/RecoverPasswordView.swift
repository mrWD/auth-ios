//
//  RecoverPasswordView.swift
//  auth
//
//  Created by Viktor Lavrov on 14.09.24.
//

import SwiftUI

struct RecoverPasswordView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var wrongUsername = 0
    @State private var wrongPassword = 0
    @State private var showingLoginScreen = false

    var body: some View {
        NavigationStack {
            ZStack {
                Color.blue
                    .ignoresSafeArea()
                Circle()
                    .scale(1.7)
                    .foregroundColor(.white.opacity(0.15))
                Circle()
                    .scale(1.35)
                    .foregroundColor(.white)
                
                VStack {
                    Title1View(text: "Recover Password")
                    
                    TextField("Username", text: $username)
                        .textFieldStyle(TextFieldStyles(
                            icon: Image(systemName: "person"),
                            state: $wrongUsername
                        ))
                    
                    Button("Send Recovery Link") {
                        authenticateUser(username: username, password: password)
                    }
                    .buttonStyle(ButtonStyles())
                    
                    NavigationLink(destination: SignInView()) {
                        Text("Login")
                    }
                }
            }
        }
        .navigationDestination(isPresented: $showingLoginScreen) {
            SignInView()
        }
        .navigationBarHidden(true)
    }
    
    func authenticateUser(username: String, password: String) {
        if username.count == 0 {
            wrongUsername = 2
            return;
        }

        wrongUsername = 0
    }
}

#Preview {
    RecoverPasswordView()
}

