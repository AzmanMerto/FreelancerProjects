//
//  AdminView.swift
//  Metin2HanesiAdminPanel
//
//  Created by NomoteteS on 19.03.2023.
//

import UIKit

enum ViewState: String, Identifiable {
    case serverThisWeek,serverVS,server1_99,server1_105,server1_120,server55_120
    
    var id: String {
        return self.rawValue
    }
}


class AdminViewModel: ObservableObject {
    
    @Published var viewState: ViewState? = nil

    @Published var isOpenEditPage: Bool
    @Published var isSended: Bool
    @Published var serverImage: UIImage?
    @Published var serverName: String
    @Published var serverDate: String
    @Published var serverUrl: String
    
    init(isOpenEditPage: Bool = false,
         isSended: Bool = false,
         serverName: String = "",
         serverDate: String = "",
         serverUrl: String = "") {
        self.isOpenEditPage = isOpenEditPage
        self.isSended = isSended
        self.serverName = serverName
        self.serverDate = serverDate
        self.serverUrl = serverUrl
    }
    
   
}

let AddDataServerModelItems: [AddDataServerModel] = [
    AddDataServerModel(buttonTitle: "Bu haftalık açılacak sunucuları eklemek için ", viewOpenCode: .serverThisWeek),
    AddDataServerModel(buttonTitle: "VS sunucuları eklemek için",viewOpenCode: .serverVS),
    AddDataServerModel(buttonTitle: "1-99 sunucuları eklemek için",viewOpenCode: .server1_99),
    AddDataServerModel(buttonTitle: "1-105 sunucuları eklemek için",viewOpenCode: .server1_105),
    AddDataServerModel(buttonTitle: "1-120 sunucuları eklemek için",viewOpenCode: .server1_120),
    AddDataServerModel(buttonTitle: "55-120 sunucuları eklemek için",viewOpenCode: .server55_120)
]
