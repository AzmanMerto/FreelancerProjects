//
//  AdminView.swift
//  Metin2HanesiAdminPanel
//
//  Created by NomoteteS on 19.03.2023.
//

import SwiftUI

struct AdminView: View {
    
    @ObservedObject var viewModel: AdminViewModel = .init()
    let items = AddDataServerModelItems
    
    var body: some View {
        ZStack {
            Color.MetinBackground
                .ignoresSafeArea()
            VStack {
                //MARK: AdminView - Header
                AdminViewHeader()
                //MARK: AdminView - Buttons
                
                VStack(spacing: 20) {
                    NewViewButton(buttonName: items[0].buttonTitle) {
                        viewModel.viewState = items[0].viewOpenCode
                    }
                    NewViewButton(buttonName: items[1].buttonTitle) {
                        viewModel.viewState = items[1].viewOpenCode
                    }
                    NewViewButton(buttonName: items[2].buttonTitle) {
                        viewModel.viewState = items[2].viewOpenCode
                    }
                    NewViewButton(buttonName: items[3].buttonTitle) {
                        viewModel.viewState = items[3].viewOpenCode
                    }
                    NewViewButton(buttonName: items[4].buttonTitle) {
                        viewModel.viewState = items[4].viewOpenCode
                    }
                    NewViewButton(buttonName: items[5].buttonTitle) {
                        viewModel.viewState = items[5].viewOpenCode
                    }
                }
                Spacer()
            }
            .onChange(of: viewModel.isSended, perform: { value in
                if !value {
                    viewModel.serverName = ""
                    viewModel.serverDate = ""
                    viewModel.serverUrl = ""
                    viewModel.serverImage = nil
                }
            })
            .padding(.bottom)
            .sheet(item: $viewModel.viewState, content: { views in
                switch views {
                    
                case .serverThisWeek:
                    AdminFullscreenView(isPressed: $viewModel.isSended, viewName: items[0].buttonTitle ,ImageURL: $viewModel.serverImage, name: $viewModel.serverName, date: $viewModel.serverDate, url: $viewModel.serverUrl) {
                        DataSetter.shared.uploaderThisWeekServerData(image: viewModel.serverImage ?? UIImage(named: "Logo")!, name: viewModel.serverName, date: viewModel.serverDate, url: viewModel.serverUrl)}
                    
                case .serverVS:
                    AdminFullscreenView(isPressed: $viewModel.isSended, viewName: items[1].buttonTitle ,ImageURL: $viewModel.serverImage, name: $viewModel.serverName, date: $viewModel.serverDate, url: $viewModel.serverUrl) {
                        DataSetter.shared.uploaderVSServerData(image: viewModel.serverImage  ?? UIImage(named: "Logo")!, name: viewModel.serverName, date: viewModel.serverDate, url: viewModel.serverUrl)}
                    
                case .server1_99:
                    AdminFullscreenView(isPressed: $viewModel.isSended, viewName: items[2].buttonTitle,ImageURL: $viewModel.serverImage, name: $viewModel.serverName, date: $viewModel.serverDate, url: $viewModel.serverUrl) {
                        DataSetter.shared.uploader1_99ServerData(image: viewModel.serverImage ?? UIImage(named: "Logo")!, name: viewModel.serverName, date: viewModel.serverDate, url: viewModel.serverUrl)}
                    
                case .server1_105:
                    AdminFullscreenView(isPressed: $viewModel.isSended, viewName: items[3].buttonTitle,ImageURL: $viewModel.serverImage, name: $viewModel.serverName, date: $viewModel.serverDate, url: $viewModel.serverUrl) {
                        DataSetter.shared.uploader1_105ServerData(image: viewModel.serverImage ?? UIImage(named: "Logo")!, name: viewModel.serverName, date: viewModel.serverDate, url: viewModel.serverUrl)}
                    
                case .server1_120:
                    AdminFullscreenView(isPressed: $viewModel.isSended, viewName: items[4].buttonTitle ,ImageURL: $viewModel.serverImage, name: $viewModel.serverName, date: $viewModel.serverDate, url: $viewModel.serverUrl) {
                        DataSetter.shared.uploader1_120ServerData(image: viewModel.serverImage ?? UIImage(named: "Logo")!, name: viewModel.serverName, date: viewModel.serverDate, url: viewModel.serverUrl)}
                    
                case .server55_120:
                    AdminFullscreenView(isPressed: $viewModel.isSended, viewName: items[5].buttonTitle ,ImageURL: $viewModel.serverImage, name: $viewModel.serverName, date: $viewModel.serverDate, url: $viewModel.serverUrl) {
                        DataSetter.shared.uploader55_120ServerData(image: viewModel.serverImage ?? UIImage(named: "Logo")!, name: viewModel.serverName, date: viewModel.serverDate, url: viewModel.serverUrl)}
                    
                }
            })
        }
    }
}

struct AdminView_Previews: PreviewProvider {
    static var previews: some View {
        AdminView()
    }
}
