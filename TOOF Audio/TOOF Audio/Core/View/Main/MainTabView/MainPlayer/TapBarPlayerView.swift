//
//  TapBarPlayerView.swift
//  TOOF Audio
//
//  Created by NomoteteS on 23.04.2023.
//

import SwiftUI

struct TapBarPlayerView: View {
    
    @ObservedObject var viewModel: MainPlayerViewModel = .init()
    
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .stroke(Color.ToofTextColor,lineWidth: 0.5)
            .overlay {
                Color.ToofBackgroundPlayerColor
                    .cornerRadius(20)
                    .padding(.all,1)
                TabPlayerItems(isPlaying: $viewModel.isPlaying, musicName: viewModel.musicName)
                    .padding(.horizontal)
            }
            .padding(.horizontal,dw(0.09))
            .onTapGesture {
                viewModel.isOpenPlayerView.toggle()
            }
            .frame(height: dw(0.18))
            .sheet(isPresented: $viewModel.isOpenPlayerView) {
                MainPlayerView(viewModel: viewModel)
            }
    }
}



struct TapBarPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.ToofBackgroundColor.ignoresSafeArea()
            TapBarPlayerView()
        }
    }
}


