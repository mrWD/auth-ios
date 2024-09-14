//
//  SignUpView.swift
//  auth
//
//  Created by Viktor Lavrov on 14.09.24.
//

import SwiftUI

struct SignUpView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var repeatPassword = ""
    @State private var wrongUsername = 0
    @State private var wrongPassword = 0
    @State private var wrongRepeatPassword = 0
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
                    Title1View(text: "Sign Up")
                    
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
                    
                    SecureField("Repeat Password", text: $repeatPassword)
                        .textFieldStyle(TextFieldStyles(
                            icon: Image(systemName: "key"),
                            state: $wrongRepeatPassword
                        ))
                    
                    Button("Sign Up") {
                        signUpUser(username: username, password: password, repeatPassword: repeatPassword)
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
    
    func signUpUser(username: String, password: String, repeatPassword: String) {
        if username.count == 0 {
            wrongUsername = 2
            return;
        }

        wrongUsername = 0
        
        if password.count == 0 {
            wrongPassword = 2
            return;
        }
        
        if password != repeatPassword {
            wrongPassword = 2
            wrongRepeatPassword = 2
            return;
        }
        
        wrongPassword = 0
        wrongRepeatPassword = 0
        showingLoginScreen = true
    }
}

#Preview {
    SignUpView()
}
