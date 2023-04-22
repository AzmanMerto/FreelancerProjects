//
//  MainBrowseView.swift
//  TOOF Audio
//
//  Created by NomoteteS on 20.04.2023.
//

import SwiftUI

struct MainBrowseView: View {
    
    @ObservedObject var viewModel = MainBrowseViewModel()
    @State var selectedConnect: ConnectSection?

    var body: some View {
        ZStack {
            Color.ToofBackgroundColor.ignoresSafeArea()
            VStack {
                mainHeader(title: TextHelper.main.mainBrowseTitle.rawValue)
                //MARK: MainBrowseView - Connect Sections
                HStack {
                    ForEach(viewModel.connectItems, id:\.connectString) { connect in
                        connectSelections(connect: connect, isSelected:
                                            Binding<Bool>(get: { selectedConnect == connect },
                                                          set: { _ in selectedConnect = connect })) {
                            //TODO: Change connect
                        }
                    }
                }
                .padding(.horizontal)
                .padding(.bottom)
                //MARK: MainBrowseView - Music Service List
                musicServiceList(viewModel: viewModel)
                    .padding(.leading)
                Spacer()
            }
            .padding(.vertical)
        }
    }
}

struct MainBrowseView_Previews: PreviewProvider {
    static var previews: some View {
        MainBrowseView()
    }
}


