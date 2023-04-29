//
//  MainDeviceView.swift
//  TOOF Audio
//
//  Created by NomoteteS on 20.04.2023.
//

import SwiftUI

struct MainDeviceView: View {
    
    @ObservedObject var viewModel : MainDeviceViewModel
    
    //TODO: Listele ve yeni deviceler ekle
    var body: some View {
        ZStack {
            Color.ToofBackgroundColor.ignoresSafeArea()
            VStack {
                mainHeader(title: TextHelper.main.mainDeviceTitle.rawValue)
                    .padding(.top)
                ToofAltButton(buttonText: TextHelper.main.mainDeviceAddNewdevice.rawValue) {
                    viewModel.isAddDevice.toggle()
                }
               Spacer()
            }
            .padding(.vertical)
            .sheet(isPresented: $viewModel.isAddDevice) {
                //TODO: Device add your phone
            }
        }
    }
}

struct MainDeviceView_Previews: PreviewProvider {
    static var previews: some View {
        MainDeviceView(viewModel: .init())
    }
}
