//
//  UserAppStates.swift
//  Shigo
//
//  Created by NomoteteS on 12.03.2023.
//

import SwiftUI

struct UserAppStates: View {
    var body: some View {
        HStack {
            VStack {
                Text("Satış")
                    .foregroundColor(.shigoLightDark)
                Circle()
                    .stroke(lineWidth: 0)
                    .foregroundColor(.shigoOrange)
                    .overlay {
                        Text("50")
                            .font(.largeTitle.bold())
                            .foregroundColor(.white)
                    }
                    .background {
                        Image("DifferentColor")
                            .resizable()
                            .clipShape(Circle())
                    }
            }
            
            VStack {
                Text("Yüklenenler")
                    .foregroundColor(.shigoLightDark)
                Circle()
                    .stroke(lineWidth: 0)
                    .foregroundColor(.shigoOrange)
                    .overlay {
                        Text("50")
                            .font(.largeTitle.bold())
                            .foregroundColor(.white)
                    }
                    .background {
                        Image("DifferentColor")
                            .resizable()
                            .clipShape(Circle())
                    }
            }
            
            VStack {
                Text("Takipçi")
                    .foregroundColor(.shigoLightDark)
                Circle()
                    .stroke(lineWidth: 0)
                    .foregroundColor(.shigoOrange)
                    .overlay {
                        Text("50")
                            .font(.largeTitle.bold())
                            .foregroundColor(.white)
                    }
                    .background {
                        Image("DifferentColor")
                            .resizable()
                            .clipShape(Circle())
                    }
            }
            
        }
        .padding(.horizontal)
    }
}


struct UserAppStates_Previews: PreviewProvider {
    static var previews: some View {
        UserAppStates()
    }
}
