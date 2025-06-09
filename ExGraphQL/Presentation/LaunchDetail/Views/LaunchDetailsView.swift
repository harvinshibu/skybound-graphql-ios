//
//  LaunchDetailsView.swift
//  ExGraphQL
//
//  Created by Harvin Shibu on 05/06/25.
//

import SwiftUI
import SDWebImageSwiftUI

struct LaunchDetailsView: View {
    let launchId: String?
    @StateObject var viewmodel: LaunchDetailViewModel = .init(usecase: Injection.shared.provideLaunchDetailUseCase())
    
    var body: some View {
        VStack {
            if let launch = viewmodel.detail {
                HStack(spacing: 10) {
                    if let missionPatch = launch.mission?.missionPatch {
                        WebImage(url: URL(string: missionPatch))
                            .resizable()
                            .indicator(.activity)
                            .scaledToFit()
                            .frame(width: 165, height: 165)
                    } else {
                        Image("placeholder")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 165, height: 165)
                    }
                    
                    VStack(alignment: .leading, spacing: 4) {
                        if let missionName = launch.mission?.name {
                            Text(missionName)
                                .font(.system(size: 24, weight: .bold))
                        }
                        
                        if let rocketName = launch.rocket?.name {
                            Text("🚀 \(rocketName)")
                                .font(.system(size: 18))
                        }
                        
                        if let launchSite = launch.site {
                            Text(launchSite)
                                .font(.system(size: 14))
                        }
                    }
                    
                    Spacer()
                }
                Spacer()
            } else {
                if viewmodel.error == nil {
                    Text("🚀 Loading...")
                        .font(.system(size: 18))
                }
            }
        }
        .padding()
        .navigationTitle(viewmodel.detail?.mission?.name ?? "")
        .navigationBarTitleDisplayMode(.inline)
        .task {
            viewmodel.fetchLaunchDetail(launchId: launchId)
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
    }
}
