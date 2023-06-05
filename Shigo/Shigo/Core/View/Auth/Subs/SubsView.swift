//
//  SubsView.swift
//  Shigo
//
//  Created by Mert Türedü on 1.06.2023.
//

import SwiftUI

struct SubsView: View {
    
    @ObservedObject var viewModel = SubsViewModel()
    
    var body: some View {
        NavigationView {
            if viewModel.isSubs {
                ZStack {
                    
                }
                .onAppear {
                    viewModel.navigateToMain.toggle()
                }
            }else {
                ZStack {
                    PrimaryBackground()
                    VStack {
                        FlagAndCountryName()
                            .padding(.top)
                        
                        Text("Uygulama Devamı için abone olmanız gerekiyor.")
                            .font(.body)
                            .foregroundColor(.white)
                            .padding(.vertical)
                            .background {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(.black)
                                    .padding(.horizontal,-10)
                            }
                        Spacer()
                        Button {
                            if viewModel.isSubs {
//                                viewModel.navigateToMain.toggle()
                            } else {
                                viewModel.isSubs.toggle()
                            }
                        } label: {
                            Text(viewModel.isSubs ? "Uygulamaya geçiş yap" : "Abone Ol" )
                        }
                        .foregroundColor(.black)
                        .font(.largeTitle)
                        .background {
                            RoundedRectangle(cornerRadius: 20)
                                .padding(-10)
                                .foregroundColor(.white)
                        }

                        
                        Spacer()
                    }
                }
            }
        }
        .navigationDestination(isPresented: $viewModel.navigateToMain) {
            MainTabBar()
        }
        .manageSubscriptionsSheet(isPresented: .constant(false))
    }
}

struct SubsView_Previews: PreviewProvider {
    static var previews: some View {
        SubsView()
    }
}
