//
//  LoginView.swift
//  Shigo
//
//  Created by NomoteteS on 4.03.2023.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        ZStack {
            //MARK: LoginView - Background Color
            LoginViewBackgroundColor()
            
            VStack {
                //MARK: LoginView - Flag & Desciption
                HStack {
                    
                    ZStack {
                        Rectangle()
                            .foregroundColor(.shigoPurple)
                            .frame(height: 50)
                        Text("Termin - Görüşme")
                            .font(.largeTitle.bold())
                            .foregroundColor(.white)
                            
                    }
                }
                
                
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

struct LoginViewBackgroundColor: View {
    var body: some View {
        VStack {
            Rectangle()
                .foregroundColor(.white)
            Rectangle()
                .foregroundColor(.shigoPurple)
        }
        .ignoresSafeArea()
    }
}
