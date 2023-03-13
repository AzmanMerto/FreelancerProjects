//
//  BuyShiView.swift
//  Shigo
//
//  Created by NomoteteS on 10.03.2023.
//

import SwiftUI

struct BuyShiView: View {
    
    @ObservedObject var viewModel: BuyShiViewModel = .init()
    
    var body: some View {
        VStack {
            HStack {
                Text("BAKİYE")
                    .bold()
                
                Spacer()
                
                Text("")
                    .background {
                        Rectangle()
                            .padding(.all,-10)
                            .foregroundColor(.shigoTextGray)
                    }
            }
            .padding(.all,30)
            
            ZStack {
                Rectangle()
                    .foregroundColor(.shigoTextGray)
                Text("Shi Edin")
                    .font(.system(size: 60).bold())
            }
            .frame(height: 200)
            
            ForEach(viewModel.shiItems,id: \.self) { item in
                ShiMoney(shiText: item.shiText, moneyText: item.moneyText)
                    .padding(.vertical)
            }
            
            Spacer()
        }
    }
}

struct BuyShiView_Previews: PreviewProvider {
    static var previews: some View {
        BuyShiView()
    }
}

