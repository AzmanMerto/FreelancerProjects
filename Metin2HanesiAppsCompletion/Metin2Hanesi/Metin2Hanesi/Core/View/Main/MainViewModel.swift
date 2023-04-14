//
//  MainViewModel.swift
//  Metin2AddServerApp
//
//  Created by NomoteteS on 16.03.2023.
//

import SwiftUI

class MainViewModel: ObservableObject {

    @Published var presentedSheet: sheetType? = nil
    @Published var isChatViewOpened: Bool
    @Published var chatText: String
    
    init(isChatViewOpened: Bool = false,
         chatText: String = "")
    {
        self.isChatViewOpened = isChatViewOpened
        self.chatText = chatText
    }
}

enum sheetType: Identifiable{
    case sheet1,sheet2,sheet3,sheet4,sheet5,sheet6
    
    var id: sheetType {
        return self
    }
}
