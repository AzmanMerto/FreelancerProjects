//
//  AddDataServerModel.swift
//  Metin2HanesiAdminPanel
//
//  Created by NomoteteS on 19.03.2023.
//

import Foundation

struct AddDataServerModel: Equatable {
    static func == (lhs: AddDataServerModel, rhs: AddDataServerModel) -> Bool {
        true
    }
    let buttonTitle: String
    let funcAction: () -> Void
}
