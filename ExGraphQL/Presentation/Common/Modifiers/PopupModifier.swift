//
//  PopupModifier.swift
//  ExGraphQL
//
//  Created by CL-2311-XJY49 on 09/06/25.
//

import SwiftUI

struct PopupModifier<PopupContent: View>: ViewModifier {
    @Binding var isPresented: Bool
    @ViewBuilder var popupContent: () -> PopupContent
    var onDismiss: (() -> Void)?
    
    var isDraggable: Bool
    var dismissable: Bool
    @State private var dragAmount: CGPoint?
    @State private var dragOffset = CGSize.zero
    
    func body(content: Content) -> some View {
        ZStack {
            content
            
            if isPresented {
                if !isDraggable{
                    Color.black.opacity(0.5)
                        .edgesIgnoringSafeArea(.all)
                        .onTapGesture {
                            // Check if the popup is not being dragged before dismissing
                            if dragOffset == .zero {
                                if dismissable{
                                    isPresented = false
                                }
                                onDismiss?()
                            }
                        }
                }
                VStack {
                    Spacer()
                    GeometryReader { gp in
                        popupContent()
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .padding(16)
                            .background(.clear)
                            .cornerRadius(8)
                            .position(self.dragAmount ?? CGPoint(x: gp.size.width / 2, y: gp.size.height / 2))
                            .gesture(
                                isDraggable ? DragGesture()
                                    .onChanged { self.dragAmount = $0.location}
                                    .onEnded { _ in withAnimation {
                                    }
                                    } : nil )
                        Spacer()
                    }
                }
                .padding(.horizontal, 16)
            }
        }
    }

}

extension View {
    func popup(isPresented: Binding<Bool>, isDraggable: Bool = false, dismissable: Bool = true, onDismiss: (() -> Void)? = nil,content: @escaping () -> some View ) -> some View {
        modifier(PopupModifier(isPresented: isPresented, popupContent: content, onDismiss: onDismiss, isDraggable: isDraggable, dismissable: dismissable))
    }
}
