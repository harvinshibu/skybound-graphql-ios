//
//  CustomAlertView.swift
//  ExGraphQL
//
//  Created by CL-2311-XJY49 on 09/06/25.
//

import SwiftUI

struct CustomAlertView: View {
    let title: String
    let description: String
    var primaryButtonTitle: String? = nil
    var secondaryButtonTitle: String? = nil
    var style: CustomAlertStyle = .default
    let onSubmit: (Bool) -> Void
    
    var body: some View {
        VStack(spacing: 20) {
            Text(title)
                .font(.headline)
                .bold()

            Text(description)
                .font(.subheadline)
                .foregroundColor(.gray)

            HStack(spacing: 20) {
                if style != .primaryOnly {
                    Button(action: {
                        onSubmit(false)
                    }) {
                        Text(secondaryButtonTitle ?? "Cancel")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.white)
                            .foregroundColor(.black)
                            .overlay(
                                RoundedRectangle(cornerRadius: 25)
                                    .stroke(Color.black, lineWidth: 2)
                            )
                            .cornerRadius(25)
                    }
                }

                Button(action: {
                    onSubmit(true)
                }) {
                    Text(primaryButtonTitle ?? "OK")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.black)
                        .foregroundColor(.white)
                        .cornerRadius(25)
                }
            }
        }
        .padding(.all, Constants.screenDynamicHeight(percent: 3.5))
        .shadow(color: .gray.opacity(0.5), radius: 4, x: 2, y: 2)
        .background(Color.white)
        .cornerRadius(20)
    }
}

enum CustomAlertStyle {
    case primaryOnly
    case `default`
}
