//
//  BuyShiView.swift
//  Shigo
//
//  Created by NomoteteS on 10.03.2023.
//

import SwiftUI

struct BuyShiView: View {
    
    @ObservedObject var viewModel: BuyShiViewModel = .init()
    @StateObject var storeKit = StoreKitManager()
    
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
            ForEach(storeKit.storeProducts) { item in
                ShiMoney(shiText: item.description,
                         moneyText: item.displayPrice)
                {
                    Task {
                        try await storeKit.purchase(item)
                    }
                }
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

