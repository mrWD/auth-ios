//
//  SwiftUIView.swift
//  auth
//
//  Created by Viktor Lavrov on 14.09.24.
//

import Foundation
import SwiftUI

struct SignInView: View {
    @EnvironmentObject private var appRootManager: AppRootManager

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
                    Title1View(text: "Login")
                    
                    TextField("Username", text: $username)
                        .textFieldStyle(TextFieldStyles(
                            icon: Image(systemName: "person"),
                            state: $wrongUsername
                        ))
                    
                    SecureField("Password", text: $password)
                        .textFieldStyle(TextFieldStyles(
                            icon: Image(systemName: "key"),
                            state: $wrongPassword
                        ))
                    
                    Button("Login") {
                        authenticateUser(username: username, password: password)
                    }
                    .buttonStyle(ButtonStyles())
                    
                    NavigationLink(destination: RecoverPasswordView()) {
                        Text("Forgot Password")
                    }
                    
                    NavigationLink(destination: SignUpView()) {
                        Text("Sign Up")
                    }
                }
            }
        }
        .navigationBarHidden(true)
    }
    
    func authenticateUser(username: String, password: String) {
        if username.lowercased() != "admin" {
            wrongUsername = 2
            return;
        }

        wrongUsername = 0
        
        if password.lowercased() != "123" {
            wrongPassword = 2
            return;
        }
        
        wrongPassword = 0

        withAnimation(.spring()) {
            appRootManager.currentRoot = .home
        }
    }
}

#Preview {
    SignInView()
}
