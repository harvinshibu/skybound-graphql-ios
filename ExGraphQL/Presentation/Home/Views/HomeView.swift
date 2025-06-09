//
//  HomeView.swift
//  ExGraphQL
//
//  Created by Harvin Shibu on 03/06/25.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var router: Router
    @StateObject var viewmodel: HomeViewModel = .init(usecase: Injection.shared.provideHomeUseCase())
    
    var body: some View {
        List {
            ForEach(0..<viewmodel.launches.count, id: \.self) { index in
                LaunchRow(launch: viewmodel.launches[index])
                    .onTapGesture {
                        router.push(.launchDetails(launchId: viewmodel.launches[index].id))
                    }
            }
            
            if viewmodel.lastConnection?.hasMore != false {
                Text("Loading...")
                    .padding()
                    .onAppear{
                        viewmodel.loadLaunchesIfTheyExist()
                    }
            }
        }
        .task {
            viewmodel.loadLaunchesIfTheyExist()
        }
        .navigationTitle("Rocket Launches")
        .navigationBarBackButtonHidden(true)
        .toolbar{
            ToolbarItem(placement: .topBarTrailing){
                Button(action: {
                    viewmodel.showLogoutPopup = true
                }){
                    Text("Logout")
                        .font(.callout)
                        .fontWeight(.semibold)
                }
            }
        }
        .onChange(of: viewmodel.error) { lsterr, err in
            if let error = err, !error.isEmpty {
                viewmodel.showErrorAlert = true
            }
        }
        .popup(isPresented: $viewmodel.showErrorAlert){
            CustomAlertView(title: "Error!",
                            description: viewmodel.error ?? "Unknown error!",
                            style: .primaryOnly,
                            onSubmit: { _ in
                viewmodel.showErrorAlert = false
            })
        }
        .popup(isPresented: $viewmodel.showLogoutPopup){
            CustomAlertView(title: "Logout",
                            description: "Are you sure you want to logout?",
                            onSubmit: { isPrimary in
                viewmodel.showLogoutPopup = false
                if isPrimary {
                    AppState.shared.handleLogout()
                }
            })
        }
    }
}

#Preview {
    HomeView()
}
