//
//  MainView.swift
//  Metin2AddServerApp
//
//  Created by NomoteteS on 16.03.2023.
//

import SwiftUI

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
                        viewModel.isChatViewOpened.toggle()
                    }
                    .padding(.horizontal)
                    SlideButton(isActived: false)
                }
                .frame(height: 40)
                .padding(.all)
                //MARK: MainView - Slider
                VStack {
                    RoundedRectangle(cornerRadius: 20)
                        .frame(height: 200)
                        .padding(.horizontal)
                }
                .padding(.bottom,40)
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
                        sheet1()
                    case .sheet2:
                        sheet2()
                    case .sheet3:
                        sheet3()
                    case .sheet4:
                        sheet4()
                    case .sheet5:
                        sheet5()
                    case .sheet6:
                        sheet6()
                    }
                }
                .presentationDetents([.medium,.large])
            }
            ChatView(isShowing: $viewModel.isChatViewOpened,
                     text: $viewModel.chatText)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

struct ChatView: View {
    
    @Binding var isShowing: Bool
    @Binding var text: String
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.3)
                .ignoresSafeArea()
                .onTapGesture {
                    isShowing.toggle()
                }
            VStack {
                //MARK: ChatView - Header
                HStack {
                    Text("Chat Ekranı")
                        .foregroundColor(.MetinYellow)
                        .font(.title3.bold())
                    Spacer()
                    Button {
                        isShowing.toggle()
                    } label: {
                        Image(ImageHelper.mainView.dismissYellowButton.rawValue)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 20)
                    }
                }
                .background {
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(.MetinBackground)
                        .padding(.all,-10)
                }
                //MARK: ChatView - ChatPlace
                VStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(.MetinBackground)
                            .padding(.all,-10)
                    }
                }
                .padding(.vertical)
                //MARK: ChatView - ChatPlace
                ZStack {
                    RoundedRectangle(cornerRadius: 5)
                        .foregroundColor(.MetinBackground)
                    HStack {
                        ZStack {
                            Text("Mesaj Gönder")
                                .opacity(text.isEmpty ? 1 : 0)
                            TextField("", text: $text)
                        }
                        .font(.caption.bold())
                        .foregroundColor(.MetinYellow)
                        Spacer()
                        Button {
                            
                        } label: {
                            
                            Text("Gönder")
                                .foregroundColor(.MetinBackground)
                                .font(.callout)
                                .fontWeight(.heavy)
                            
                        }
                        .background(content: {
                            RoundedRectangle(cornerRadius: 5)
                                .foregroundColor(.MetinYellow)
                                .padding(.all,-5)
                        })
                        .padding(.vertical,5)
                    }
                    .padding(.horizontal)
                }
                .frame(height: 40)
                Spacer()
            }
            .padding(.horizontal)
        }
        .opacity(isShowing ? 1 : 0)
    }
}
