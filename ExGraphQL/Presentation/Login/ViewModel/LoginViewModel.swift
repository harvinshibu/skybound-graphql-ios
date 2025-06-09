//
//  LoginViewModel.swift
//  ExGraphQL
//
//  Created by Harvin Shibu on 03/06/25.
//

import Foundation

@MainActor
final class LoginViewModel: ObservableObject {
    @Published var error: String? = ""
    @Published var loading: Bool = false
    @Published var emailField: String = ""
    @Published var isLoggedIn: Bool = false
    
    private let usecase: LoginUsecase
    
    init(usecase: LoginUsecase) {
        self.usecase = usecase
    }
    
    func login()  {
        error = nil
        loading = true
        
        guard emailField.validateEmail() else {
            self.error = "Invalid Email"
            loading = false
            return
        }
        
        usecase.execute(email: emailField, completion: { result in
            switch result {
            case .success(let isLogged):
                self.isLoggedIn = isLogged
            case .failure(let error):
                self.error = error.localizedDescription
                
            }
            self.loading = false
        })
    }
}
