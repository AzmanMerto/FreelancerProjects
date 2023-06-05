//
//  ProductDetailModel.swift
//  Shigo
//
//  Created by Mert Türedü on 5.06.2023.
//

import Foundation

class ProductDetailModel: ObservableObject {
    @Published var products: Products
    @Published var code: String
    @Published var itemCount: String
    @Published var color: String
    @Published var orderUserNameAndSurname: String
    @Published var address: String
    @Published var phoneOrEmail: String
    @Published var followNumber: Bool
    @Published var errorMassage: String = ""
    
    init(products: Products,
        code: String = "",
        itemCount: String = "",
        color: String = "",
        orderUserNameAndSurname: String = "",
        address: String = "",
        phoneOrEmail: String = "",
        followNumber: Bool = false
    ) {
        self.products = products
        self.code = code
        self.itemCount = itemCount
        self.color = color
        self.orderUserNameAndSurname = orderUserNameAndSurname
        self.address = address
        self.phoneOrEmail = phoneOrEmail
        self.followNumber = followNumber
    }
    
    func uploadOrder() {
        
        let productData: [String : Any] =
        [ "orderName": self.products.productName,
          "orderPrice": self.products.productPrice,
          "orderCode": self.code,
          "orderItemCount": self.itemCount,
          "orderColor": self.color,
          "userName&Surname": self.orderUserNameAndSurname,
          "userAdress": self.address,
          "userPhonreOrMail": self.phoneOrEmail]
        
        COLLECTION_ORDERS.addDocument(data: productData) { error in
            if let error = error {
                print(error.localizedDescription)
            }else {
                print("success")
            }
        }
    }
}
