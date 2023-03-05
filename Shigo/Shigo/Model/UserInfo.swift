//
//  UserInfo.swift
//  Shigo
//
//  Created by NomoteteS on 5.03.2023.
//

import Foundation

struct UserInfo: Identifiable{
    let id: String = UUID().uuidString
    let name: String = ""
    let email: String = ""
    let password: String = ""
}
