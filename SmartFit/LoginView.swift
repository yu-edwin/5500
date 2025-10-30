//
//  LoginView.swift
//  SmartFit
//
//  Created by Edwin Yu
//

import SwiftUI
import AuthenticationServices

struct LoginView: View {
    var onSignIn: (String, String, String?) -> Void

    @State private var isLoading = false
    @State private var errorMessage: String?

    var body: some View {
        VStack(spacing: 30) {
            Spacer()

            // App Logo/Title
            VStack(spacing: 10) {
                Image(systemName: "hanger")
                    .font(.system(size: 80))
                    .foregroundColor(.blue)

                Text("SmartFit")
                    .font(.largeTitle)
                    .fontWeight(.bold)

                Text("Your Virtual Wardrobe")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }

            Spacer()

            // Sign in with Google Button
            SignInWithAppleButton(
                .signIn,
                onRequest: { request in
                    request.requestedScopes = [.email, .fullName]
                },
                onCompletion: { result in
                    handleSignInWithApple(result)
                }
            )
            .signInWithAppleButtonStyle(.black)
            .frame(height: 50)
            .padding(.horizontal, 40)

            // Google Sign-In Button (Custom)
            Button(action: {
                // This will be handled by Google Sign-In SDK
                // For now, showing a placeholder
                handleGoogleSignIn()
            }) {
                HStack {
                    Image(systemName: "g.circle.fill")
                        .font(.title2)

                    Text("Sign in with Google")
                        .fontWeight(.semibold)
                }
                .frame(maxWidth: .infinity)
                .frame(height: 50)
                .background(Color.white)
                .foregroundColor(.black)
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                )
            }
            .padding(.horizontal, 40)
            .disabled(isLoading)

            if let errorMessage = errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .font(.caption)
                    .padding(.horizontal, 40)
            }

            if isLoading {
                ProgressView()
                    .padding()
            }

            Spacer()

            Text("By signing in, you agree to our Terms & Privacy Policy")
                .font(.caption)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 40)
                .padding(.bottom, 20)
        }
    }

    private func handleSignInWithApple(_ result: Result<ASAuthorization, Error>) {
        switch result {
        case .success(let authorization):
            if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
                let email = appleIDCredential.email ?? "unknown@apple.com"
                let name = appleIDCredential.fullName?.givenName
                let userIdentifier = appleIDCredential.user

                onSignIn(userIdentifier, email, name)
            }
        case .failure(let error):
            errorMessage = "Sign in failed: \(error.localizedDescription)"
        }
    }

    private func handleGoogleSignIn() {
        isLoading = true
        errorMessage = nil

        // Placeholder for Google Sign-In
        // In production, you would use GoogleSignIn SDK here
        // For now, simulating a sign-in for testing
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            // Example: onSignIn("google_token_123", "user@gmail.com", "User Name")
            isLoading = false
            errorMessage = "Google Sign-In SDK not configured yet. Please add GoogleSignIn pod."
        }
    }
}

#Preview {
    LoginView { token, email, name in
        print("Signed in: \(email)")
    }
}
