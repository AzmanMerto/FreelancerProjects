//
//  MainView.swift
//  Metin2AddServerApp
//
//  Created by NomoteteS on 16.03.2023.
//

import SwiftUI

struct MainView: View {
    
    @ObservedObject var viewModel: MainViewModel = .init()
    @State var presentedSheet: sheetType? = nil
    
    enum sheetType: Identifiable{
        case sheet1,sheet2,sheet3,sheet4,sheet5,sheet6
        
        var id: sheetType {
            return self
        }
    }
    
    var body: some View {
        ZStack {
            Color.MetinBackground
                .ignoresSafeArea()
            VStack {
                //MARK: MainView - Header
                HStack {
                    Image("AppLogoIcon")
                        .resizable()
                        .frame(width: 180,
                               height: 36)
                    Spacer()
                    ChatButton()
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
                        presentedSheet = .sheet1
                    }
                    .padding(.vertical,20)
                    RegularButton(buttonText: "1-99 PVP Serverler"){
                        presentedSheet = .sheet2
                    }
                    .padding(.vertical,20)
                    RegularButton(buttonText: "1-105 PVP Serverler"){
                        presentedSheet = .sheet3
                    }
                    .padding(.vertical,20)
                    RegularButton(buttonText: "1-120 PVP Serverler"){
                        presentedSheet = .sheet4
                    }
                    .padding(.vertical,20)
                    RegularButton(buttonText: "55-120 PVP Serverler"){
                        presentedSheet = .sheet5
                    }
                    .padding(.vertical,20)
                    RegularButton(buttonText: "Vs’lik Serverler"){
                        presentedSheet = .sheet6
                    }
                    .padding(.vertical,20)
                }
                Spacer()
            }
            .sheet(item: $presentedSheet) { sheetType in
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
                .presentationDetents([.medium])
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
