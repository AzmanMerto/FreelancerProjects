//
//  MainView.swift
//  Metin2AddServerApp
//
//  Created by NomoteteS on 16.03.2023.
//

import SwiftUI
import FirebaseStorage

struct MainView: View {
    
    @ObservedObject var viewModel: MainViewModel = .init()
    
    var body: some View {
        ZStack {
            Color.MetinBackground
                .ignoresSafeArea()
            VStack {
                //MARK: MainView - Header
                HStack {
                    Image(ImageHelper.mainView.appLogo.rawValue)
                        .resizable()
                        .scaledToFit()
                    Spacer()
                    ChatButton{
                        viewModel.isOpenChat.toggle()
                    }
                    .padding(.horizontal)
                    PopButton{
                        viewModel.isPressPop.toggle()
                    }
                }
                .frame(height: 40)
                .padding(.all)
                //MARK: MainView - Slider
                VStack {
                    Image(uiImage: SliderImageItems[viewModel.selectedIndex])
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(20)
                        .frame(height: 150)
                }
                .padding(.horizontal)
                .padding(.vertical,20)
                //MARK: MainView - Buttons
                VStack {
                    RegularButton(buttonText: "Bu hafta açılacak pvp serverler"){
                        viewModel.presentedSheet = .sheet1
                    }
                    .padding(.vertical,20)
                    RegularButton(buttonText: "1-99 PVP Serverler"){
                        viewModel.presentedSheet = .sheet2
                    }
                    .padding(.vertical,20)
                    RegularButton(buttonText: "1-105 PVP Serverler"){
                        viewModel.presentedSheet = .sheet3
                    }
                    .padding(.vertical,20)
                    RegularButton(buttonText: "1-120 PVP Serverler"){
                        viewModel.presentedSheet = .sheet4
                    }
                    .padding(.vertical,20)
                    RegularButton(buttonText: "55-120 PVP Serverler"){
                        viewModel.presentedSheet = .sheet5
                    }
                    .padding(.vertical,20)
                    RegularButton(buttonText: "Vs’lik Serverler"){
                        viewModel.presentedSheet = .sheet6
                    }
                    .padding(.vertical,20)
                }
                Spacer()
            }
            .sheet(item: $viewModel.presentedSheet) { sheetType in
                VStack {
                    switch sheetType {
                    case .sheet1:
                        PresentedSheetsView(buttonText: "Bu hafta açılacak pvp serverler", posts: FirestoreManager.shared.postThisWeek){
                            FirestoreManager.shared.fetchPosts(collection: "thisWeekServer")
                        }
                    case .sheet2:
                        PresentedSheetsView(buttonText: "1-99 PVP Serverler", posts: FirestoreManager.shared.postThisWeek){
                            FirestoreManager.shared.fetchPosts(collection: "1-99Server")
                        }
                    case .sheet3:
                        PresentedSheetsView(buttonText: "1-105 PVP Serverler", posts: FirestoreManager.shared.postThisWeek){
                            FirestoreManager.shared.fetchPosts(collection: "1-105Server")
                        }
                    case .sheet4:
                        PresentedSheetsView(buttonText: "1-120 PVP Serverler", posts: FirestoreManager.shared.postThisWeek){
                            FirestoreManager.shared.fetchPosts(collection: "1-120Server")
                        }
                    case .sheet5:
                        PresentedSheetsView(buttonText: "55-120 PVP Serverler", posts: FirestoreManager.shared.postThisWeek){
                            FirestoreManager.shared.fetchPosts(collection: "55-120Server")
                        }
                    case .sheet6:
                        PresentedSheetsView(buttonText: "Vs’lik Serverler", posts: FirestoreManager.shared.postThisWeek){
                            FirestoreManager.shared.fetchPosts(collection: "VSServer")
                        }
                    }
                }
                .presentationDetents([.medium,.large])
            }
            PopView(isShowed: $viewModel.isPressPop)
            ChatView(isShowing: $viewModel.isOpenChat,
                     text: $viewModel.chatText)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}


