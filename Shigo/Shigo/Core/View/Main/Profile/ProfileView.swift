//
//  ProfileView.swift
//  Shigo
//
//  Created by NomoteteS on 10.03.2023.
//

import SwiftUI
import Kingfisher

struct ProfileView: View {
    
    @ObservedObject var viewModel = AuthManager()
    
    var body: some View {
        ZStack {
            Color.shigoPurple
                .ignoresSafeArea()
            VStack {
                Spacer()
                VStack {
                    Text(viewModel.userData!.fullname)
                        .font(.largeTitle.bold())
                    Text("unknown title")
                        .foregroundColor(.shigoOrange)
                        .font(.title3)
                    Text("unknown job")
                }
                .foregroundColor(Color.shigoLightDark)
                
                Group {
                    KFImage(URL(string: viewModel.userData!.profileImageUrl))
                        .resizable()
                        .clipShape(Circle())
                        .scaledToFit()
                        .frame(width: 200,height: 400)
                        .background {
                            Circle()
                                .foregroundColor(.white)
                                .frame(width: 203)
                        }
                }
                .frame(height: 250)
                
                ZStack {
                    Rectangle()
                        .foregroundColor(.shigoOrange)
                    Text("%100 Olumlu Yorum")
                        .font(.title3.bold())
                        .foregroundColor(.white)
                }
                .frame(height: 40)
                
                Spacer()
                UserAppStates()
                
                Spacer()
                Spacer()
            }
            .multilineTextAlignment(.center)
        }
    }
}

//struct ProfileView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileView()
//    }
//}

