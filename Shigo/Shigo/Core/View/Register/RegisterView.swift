//
//  RegisterView.swift
//  Shigo
//
//  Created by NomoteteS on 5.03.2023.
//

import SwiftUI

struct RegisterView: View {
    
    @StateObject var viewModel: RegisterViewModel = .init()
    @EnvironmentObject var coordinator : PrimaryCoordinator
    
    var body: some View {

        ZStack {
            PrimaryBackground()
            VStack {
                
                    
                ZStack(alignment: .center) {
                    RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(.shigoPurple)
                    .frame(width: 96,height: 96)
                    
                    Text("+")
                        .font(.system(size: 100))
                        .foregroundColor(.white)
                        .padding(.bottom)
                }
                .frame(width: 96,height: 96)
                .padding(.top,50)

               
                //MARK: RegisterView - Textfield space
                ZStack {
                    Rectangle()
                        
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.white)
                        .padding()
                    //MARK: RegisterView - TextFields
                    VStack {
                        VStack(spacing: 25) {
                            CustomTextField(text: "E-Mail",
                                            textField: $viewModel.email)
                            CustomTextField(text: "İsminiz",
                                            textField: $viewModel.name)
                            CustomTextField(text: "Password",
                                            textField: $viewModel.password)
                            CustomTextField(text: "Again Password",
                                            textField: $viewModel.againPassword)
                        }
                        .padding(.all)
                        PrimaryChangeView(text: "ÜYE OL",
                                          color: .shigoPurple,
                                          textColor: .white) {
                            
                        }
                                          .padding(.horizontal)
                                          .padding(.all)
                    }
                    
                }
                .padding(EdgeInsets.init(top: 50, leading: 20, bottom: 50, trailing: 20))
                
                PrimaryChangeView(text: "GİRİŞ YAP") {
                    coordinator.pop()
                }
            }
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
