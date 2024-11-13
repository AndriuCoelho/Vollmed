//
//  HomeView.swift
//  Vollmed
//
//  Created by Giovanna Moeller on 29/08/23.
//

import SwiftUI

struct HomeView: View {
    var viewModel = HomeViewModel(service: HomeNetworkingService(), authService: AuthenticationService())
    
    @State private var specialists: [Specialist] = []
    @State private var isShowingSnackBar = false
    @State private var snackBarMessage = ""
    
    var body: some View {
        ZStack {
            ScrollView(showsIndicators: false) {
                VStack() {
                    Image("Logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200)
                        .padding(.vertical, 32)
                    Text("Boas-vindas!")
                        .font(.title2)
                        .bold()
                        .foregroundColor(Color("LightBlue"))
                    Text("Veja abaixo os especialistas da Vollmed disponíveis e marque já a sua consulta!")
                        .font(.title3)
                        .bold()
                        .foregroundColor(.accentColor)
                        .multilineTextAlignment(.center)
                        .padding(.vertical, 16)
                    ForEach(specialists) { specialist in
                        SpecialistCardView(specialist: specialist)
                            .padding(.bottom, 8)
                    }
                }
                .padding(.horizontal)
            }
            .padding(.top)
            .onAppear {
                Task {
                    do {
                        guard let response = try await viewModel.getSpecialists() else { return }
                        self.specialists = response
                    } catch(let error) {
                        let errorType = error as? RequestError
                        isShowingSnackBar = true
                        snackBarMessage = errorType?.customMessage ?? ""
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        Task {
                            await viewModel.logout()
                        }
                    }) {
                        HStack(spacing: 2) {
                            Image(systemName: "rectangle.portrait.and.arrow.right")
                            Text("Logout")
                        }
                    }
                }
            }
            if isShowingSnackBar {
                SnackBarErrorView(isShowing: $isShowingSnackBar,
                                  message: snackBarMessage)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
