//
//  MainDeviceView.swift
//  TOOF Audio
//
//  Created by NomoteteS on 20.04.2023.
//

import SwiftUI

struct MainDeviceView: View {
    
    @ObservedObject var viewModel = MainDeviceViewModel()
    
    var body: some View {
        ZStack {
            Color.ToofBackgroundColor.ignoresSafeArea()
            VStack {
                mainHeader(title: TextHelper.main.mainDeviceTitle.rawValue)
                
               
            }
        }
    }
}

struct MainDeviceView_Previews: PreviewProvider {
    static var previews: some View {
        MainDeviceView()
    }
}
