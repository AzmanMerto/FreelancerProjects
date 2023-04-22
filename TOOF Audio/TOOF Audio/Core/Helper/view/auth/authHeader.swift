//
//  authHeader.swift
//  TOOF Audio
//
//  Created by NomoteteS on 19.04.2023.
//

import SwiftUI

struct authHeader: View {
    
    var isShowBackButton: Bool?
    var title: String
    var description: String
    
    var body: some View {
        VStack {
            HStack {
            if isShowBackButton ?? false {
                    //MARK: authHeader - Back Button
                ToofBackButton()
                }
                Spacer()
            }
            .frame(height: dw(0.07))
            .padding(.horizontal)
            //MARK: authHeader - Logo
            Image(ImageHelper.app.toofLogo.rawValue)
                .resizable()
                .scaledToFit()
                .frame(height: dh(0.08))
                .padding(.top)
                .padding(.bottom,dh(0.08))
            //MARK: authHeader - Text
            LazyVStack(alignment: .leading) {
                Text(title.locale())
                    .font(.default20)
                    .fontWeight(.bold)
                    .foregroundColor(.ToofTextColor)
                Text(description.locale())
                    .font(.rounded16)
                    .fontWeight(.light)
                    .foregroundColor(.ToofTextColor)
            }
            .padding(.leading)
        }
    }
}

struct authHeader_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            authBackground()
            authHeader(isShowBackButton: true, title: "Title", description: "Description")
        }
    }
}

