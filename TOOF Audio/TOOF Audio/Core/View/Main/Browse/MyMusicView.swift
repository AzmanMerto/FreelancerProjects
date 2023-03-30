//
//  MyMusicView.swift
//  TOOF Audio
//
//  Created by NomoteteS on 30.03.2023.
//

import SwiftUI

struct MyMusicView: View {
    
    @ObservedObject var viewModel: MainViewModel = .init()
    
    var body: some View {
        ZStack {
            Color.ToofBackgroundColor
                .ignoresSafeArea()
            VStack{
                MainTitleAndBack(isBackButtonShowing: true, title: TextHelper.main.mainBrowseMyMusic.rawValue)
                    .padding(.vertical,40)
                //TODO: Listing Music in iPhone
//                List() { musics in
//
//                }
                Spacer()
            }
        }
    }
}

struct MyMusicView_Previews: PreviewProvider {
    static var previews: some View {
        MyMusicView()
    }
}
