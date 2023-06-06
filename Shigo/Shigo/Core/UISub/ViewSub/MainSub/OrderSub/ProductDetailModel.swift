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
    @Published var fallowNumber: Bool
    @Published var errorMassage: String = ""
    
    init(products: Products,
        code: String = "",
        itemCount: String = "",
        color: String = "",
        orderUserNameAndSurname: String = "",
        address: String = "",
        phoneOrEmail: String = "",
        fallowNumber: Bool = false
    ) {
        self.products = products
        self.code = code
        self.itemCount = itemCount
        self.color = color
        self.orderUserNameAndSurname = orderUserNameAndSurname
        self.address = address
        self.phoneOrEmail = phoneOrEmail
        self.fallowNumber = fallowNumber
    }
    
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return formatter
    }()
    
    
    func uploadOrder() {
        
        let currentTime = dateFormatter.string(from: Date())

        let productData: [String : Any] =
        [ "orderName": self.products.productName,
          "orderPrice": self.fallowNumber ? String(format: "%.2f EUR", self.products.productPrice + 1.10) : String(format: "%.2f EUR", self.products.productPrice),
          "orderCode": self.code,
          "orderItemCount": self.itemCount,
          "orderColor": self.color,
          "userName&Surname": self.orderUserNameAndSurname,
          "userAdress": self.address,
          "userPhonreOrMail": self.phoneOrEmail]
        
        COLLECTION_ORDERS.document(currentTime).setData(productData) { error in
            if let error = error {
                print(error.localizedDescription)
            }else {
                print("success")
            }
        }
    }
}
