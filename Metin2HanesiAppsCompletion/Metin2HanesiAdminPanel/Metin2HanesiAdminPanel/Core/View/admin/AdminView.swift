//
//  AdminView.swift
//  Metin2HanesiAdminPanel
//
//  Created by NomoteteS on 19.03.2023.
//

import SwiftUI

struct AdminView: View {
    
    @ObservedObject var viewModel: AdminViewModel = .init()
    
    var body: some View {
        ZStack {
            Color.MetinBackground
                .ignoresSafeArea()
            VStack {
                //MARK: AdminView - Header
                AdminViewHeader()
                //MARK: AdminView - Buttons
                ForEach(viewModel.AddDataServerModelItems, id: \.buttonTitle) { data in
                    VStack{
                        NewViewButton(buttonName: data.buttonTitle) {
                            viewModel.isOpenEditPage.toggle()
                        }
                    }
                    .padding(.bottom)
                    .sheet(isPresented: $viewModel.isOpenEditPage) {
                        ZStack {
                            Color.MetinBlack
                                .ignoresSafeArea()
                            ScrollView(.vertical, showsIndicators: false) {
                                NewViewButton(buttonName: data.buttonTitle) { }
                                    .padding(.all)
                                VStack {
                                    AddDataTextfield(text: "Sunucu İsmi",
                                                     textData: $viewModel.serverName)
                                        .padding(.vertical)
                                    AddDataTextfield(text: "Sunucu Açılış Tarihi",
                                                     textData: $viewModel.serverDate)
                                        .padding(.vertical)
                                    AddDataTextfield(text: "Sunucu Linki",
                                                     textData: $viewModel.serverUrl)
                                        .padding(.vertical)
                                }
                                Spacer()
                                
                                Circle()
                                    .padding(.all,30)
                                
                                NewViewButton(buttonName: "Gönder") {
                                    DispatchQueue.main.asyncAfter(deadline: .now()){

                                    }
                                }
                                    
                            }
                            .padding(.top)
                        }
                        .presentationDetents([.medium, .large])
                    }
                }
            }
        }
    }
}

struct AdminView_Previews: PreviewProvider {
    static var previews: some View {
        AdminView()
            .preferredColorScheme(.dark)
    }
}
