//
//  DeviceSearchView.swift
//  TOOF Audio
//
//  Created by NomoteteS on 19.04.2023.
//

import SwiftUI

struct DeviceSearchView: View {
    
    @ObservedObject var viewModel = DeviceSearchViewModel()
    
    var body: some View {
        ZStack {
            Color.ToofBackgroundColor.ignoresSafeArea()
            VStack {
                TabView(selection: $viewModel.selected) {
                    ForEach(viewModel.DeviceViewItems, id: \.tag) { data in
                        VStack {
                            //MARK: DeviceSearchView - Header
                            deviceHeader(image: data.image,
                                         title: data.title,
                                         description: data.description)
                            Spacer()
                            //MARK: DeviceSearchView - Button
                            ZStack {
                                NavigationLink(isActive: $viewModel.isNavigateToFinder) {
                                    DeviceFinderView()
                                        .hideNavigationBar()
                                } label: {  }
                                ToofButton(buttonText: data.button ) {
                                    withAnimation {
                                        if viewModel.selected == 1 {
                                            viewModel.isNavigateToFinder.toggle()
                                        }else {
                                            viewModel.selected += 1
                                        }
                                    }
                                }
                            }
                            Spacer()
                        }
                        .tag(data.tag)
                    }
                    .padding(.vertical)
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                .indexViewStyle(.page(backgroundDisplayMode: .always))
                .padding(.vertical)
            }
        }
    }
}

struct DeviceSearchView_Previews: PreviewProvider {
    static var previews: some View {
        DeviceSearchView()
    }
}


