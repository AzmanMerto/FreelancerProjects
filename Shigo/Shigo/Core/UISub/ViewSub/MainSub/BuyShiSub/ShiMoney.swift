//
//  ShiMoney.swift
//  Shigo
//
//  Created by NomoteteS on 11.03.2023.
//

import SwiftUI

struct ShiMoney: View {
    
    var shiText: String
    var moneyText: String
    var action: () -> ()
    
    var body: some View {
        HStack {
            Image(Imagements.Main.mainTab.rawValue)
                .font(.body)
            Text("\(shiText) Shi")
                .font(.title3.bold())
            Spacer()
            Button {
                action()
            } label: {
                ZStack {
                    Text(moneyText)
                        .font(.title3.bold())
                        .padding(.horizontal)
                }
                .background {
                    Rectangle()
                        .foregroundColor(.shigoPurple)
                        .padding(.all,-5)
                }
            }
            .tint(.white)
        }
        .padding(.horizontal,30)
    }
}


struct ShiMoney_Previews: PreviewProvider {
    static var previews: some View {
        ShiMoney(shiText: "50", moneyText: "0.50") { }
    }
}
