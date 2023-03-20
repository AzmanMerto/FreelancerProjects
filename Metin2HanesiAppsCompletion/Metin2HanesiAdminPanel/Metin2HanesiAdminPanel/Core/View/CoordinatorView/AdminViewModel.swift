//
//  AdminView.swift
//  Metin2HanesiAdminPanel
//
//  Created by NomoteteS on 19.03.2023.
//

import Foundation

class AdminViewModel: ObservableObject {
    
    let AddDataServerModelItems: [AddDataServerModel] = [
    AddDataServerModel(buttonTitle: "Bu haftalık açılacak sunucuları eklemek için"),
    AddDataServerModel(buttonTitle: "VS sunucuları eklemek için"),
    AddDataServerModel(buttonTitle: "1-99 sunucuları eklemek için"),
    AddDataServerModel(buttonTitle: "1-105 sunucuları eklemek için"),
    AddDataServerModel(buttonTitle: "1-120 sunucuları eklemek için"),
    AddDataServerModel(buttonTitle: "55-120 sunucuları eklemek için")

    ]
    
}
