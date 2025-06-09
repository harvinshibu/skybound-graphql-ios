//
//  LoginView.swift
//  ExGraphQL
//
//  Created by Harvin Shibu on 03/06/25.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var router: Router
    @StateObject var viewModel: LoginViewModel = .init(usecase: Injection.shared.provideLoginUseCase())
    
    var body: some View {
        VStack(alignment: .center ,spacing: 30) {
            Spacer()
            Text("Login")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            TextField("Enter your email", text: $viewModel.emailField)
                .keyboardType(.emailAddress)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .textInputAutocapitalization(.never)
            
            Button(action: {
                viewModel.login()
            }) {
                Text(!viewModel.loading ? "Submit" : "Submitting...")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            } .disabled(viewModel.loading)
            
            if let errorText = viewModel.error {
                Text(errorText)
                    .foregroundStyle(.red)
            }
            
            Spacer()
        }
        .padding(.horizontal, 20)
        .onChange(of: viewModel.isLoggedIn){ oldValue, newValue in
            if newValue{
                router.push(.home)
            }
        }
    }
}

#Preview {
    LoginView()
}
