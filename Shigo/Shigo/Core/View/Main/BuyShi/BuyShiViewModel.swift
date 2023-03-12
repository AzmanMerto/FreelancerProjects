//
//  BuyShiViewModel.swift
//  Shigo
//
//  Created by NomoteteS on 10.03.2023.
//

import SwiftUI

class BuyShiViewModel: ObservableObject {
    
    var shiItems: [ShiItem] = [
    ShiItem(shiText: "50", moneyText: "0.50"),
    ShiItem(shiText: "100", moneyText: "1.00"),
    ShiItem(shiText: "200", moneyText: "2.00"),
    ShiItem(shiText: "500", moneyText: "5.00"),
    ShiItem(shiText: "1000", moneyText: "10.00")
    ]
}

struct ShiItem: Hashable {
    var shiText: String
    var moneyText: String
}
