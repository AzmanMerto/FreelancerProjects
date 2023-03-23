//
//  AdminView.swift
//  Metin2HanesiAdminPanel
//
//  Created by NomoteteS on 19.03.2023.
//

import UIKit

class AdminViewModel: ObservableObject {
    
    @Published var isOpenEditPage: Bool
    @Published var serverImage: UIImage
    @Published var serverName: String
    @Published var serverDate: String
    @Published var serverUrl: String
        
    init(isOpenEditPage: Bool = false,
         serverImage: UIImage = UIImage(),
         serverName: String = "",
         serverDate: String = "",
         serverUrl: String = "") {
        self.isOpenEditPage = isOpenEditPage
        self.serverImage = serverImage
        self.serverName = serverName
        self.serverDate = serverDate
        self.serverUrl = serverUrl
    }
    
    let AddDataServerModelItems: [AddDataServerModel] = [
        AddDataServerModel(buttonTitle: "Bu haftalık açılacak sunucuları eklemek için",funcAction: { DataSetter.shared.uploaderThisWeekServerData(image: , name: self.serverImage, date: self.serverDate, url: self.serverLink)}),
        AddDataServerModel(buttonTitle: "VS sunucuları eklemek için",funcAction: {   }),
        AddDataServerModel(buttonTitle: "1-99 sunucuları eklemek için",funcAction: {   }),
        AddDataServerModel(buttonTitle: "1-105 sunucuları eklemek için",funcAction: {   }),
        AddDataServerModel(buttonTitle: "1-120 sunucuları eklemek için",funcAction: {   }),
        AddDataServerModel(buttonTitle: "55-120 sunucuları eklemek için",funcAction: {   })
    ]
}
