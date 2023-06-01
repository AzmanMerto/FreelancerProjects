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
            ZStack {
                PrimaryBackground()
                VStack {
                    FlagAndCountryName()
                        .padding(.top)
                    
                    
                    Spacer()
                    
                    Text("Uygulama Devamı için abone olmanız gerekiyor.")
                        .font(.body)
                        .foregroundColor(.white)
                        .padding(.vertical)
                    Button {
                        if viewModel.isSubs {
                            viewModel.navigateToMain.toggle()
                        } else {
                            
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
        .navigationDestination(isPresented: $viewModel.navigateToMain) {
            MainTabBar()
        }
    }
}

struct SubsView_Previews: PreviewProvider {
    static var previews: some View {
        SubsView()
    }
}
