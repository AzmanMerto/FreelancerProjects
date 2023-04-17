//
//  MainViewModel.swift
//  Metin2AddServerApp
//
//  Created by NomoteteS on 16.03.2023.
//

import SwiftUI

class MainViewModel: ObservableObject {

    @Published var presentedSheet: sheetType? = nil
    @Published var isOpenChat: Bool
    @Published var isPressPop: Bool
    @Published var selectedIndex: Int
    @Published var chatText: String
    
    init(isOpenChat: Bool = false,
         isPressPop: Bool = false,
         selectedIndex: Int = 0,
         chatText: String = "")
    {
        self.isOpenChat = isOpenChat
        self.isPressPop = isPressPop
        self.selectedIndex = selectedIndex
        self.chatText = chatText
        self.timerForSlider()
    }
    
    func timerForSlider() {
        Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { _ in
            if self.selectedIndex == 2 {
                self.selectedIndex = 0
            } else {
                self.selectedIndex += 1
            }
        }
    }
}

enum sheetType: Identifiable{
    case sheet1,sheet2,sheet3,sheet4,sheet5,sheet6
    
    var id: sheetType {
        return self
    }
}

var SliderImageItems = [
    UIImage(named:(ImageHelper.slider.firstSliderImage.rawValue))!,
    UIImage(named:(ImageHelper.slider.secondSliderImage.rawValue))!,
    UIImage(named:(ImageHelper.slider.thirdSliderImage.rawValue))!
]
