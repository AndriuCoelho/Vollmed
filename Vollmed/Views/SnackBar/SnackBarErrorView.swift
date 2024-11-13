//
//  SnackBarErrorView.swift
//  Vollmed
//
//  Created by Ândriu F Coelho on 24/09/23.
//

import SwiftUI

struct SnackBarErrorView: View {
    
    // MARK: - Attributes
    
    @Binding var isShowing: Bool
    var message: String
    
    var body: some View {
        VStack {
            Spacer()
            if isShowing {
                Text(message)
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .transition(.move(edge: .bottom))
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                            withAnimation {
                                isShowing = false
                            }
                        }
                    }
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal)
        .padding(.bottom, isShowing ? UIApplication.shared.getKeyWindow?.safeAreaInsets.bottom ?? 0 : -100)
    }
}

struct SnackBarErrorView_Previews: PreviewProvider {
    static var previews: some View {
        SnackBarErrorView(isShowing: .constant(true), message: "Ops! Estamos trabalhando para solucionar esse problema")
        
    }
}
