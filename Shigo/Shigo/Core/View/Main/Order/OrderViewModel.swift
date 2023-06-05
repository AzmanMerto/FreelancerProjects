//
//  OrderViewModel.swift
//  Shigo
//
//  Created by NomoteteS on 10.03.2023.
//

import Foundation

class OrderViewModel: ObservableObject {
    
    @Published var selectedProduct: Products?
    
    init(selectedProduct : Products? = nil) {
        self.selectedProduct = selectedProduct
    }
    
    
    var productItems: [Products] = [
        Products(id: 0,productName: "Db01 - Db05", productPrice: 5.00),
        Products(id: 1,productName: "B06 - B29", productPrice: 4.00),
        Products(id: 2,productName: "Dk01 - Dk19", productPrice: 3.00),
        Products(id: 3,productName: "K20 - K79", productPrice: 2.50),
        Products(id: 4,productName: "Öb01 - Öb19", productPrice: 3.50),
        Products(id: 5,productName: "Ök01 - Ök19", productPrice: 2.00)


        
    ]
}
