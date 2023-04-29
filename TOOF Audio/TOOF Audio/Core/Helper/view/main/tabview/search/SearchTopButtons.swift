//
//  SearchTopButtons.swift
//  TOOF Audio
//
//  Created by NomoteteS on 26.04.2023.
//

import SwiftUI

struct SearchTopButtons: View {
    
    var refreshButton: () -> ()
    var appleButton: () -> ()
    var addButton: () -> ()
    
    var body: some View {
        HStack {
            //MARK: SearchView - Refresh button
            Button {
                print("Press to Refresh")
                refreshButton()
            } label: {
                Image(systemName: "arrow.clockwise")
                    .font(.default22)
                    .foregroundColor(.ToofButtonColor)
            }
            Spacer()
            //MARK: SearchView - Apple Sync Button
            Button {
                print("Press to ShowDocumentPicker")
                appleButton()
            } label: {
                Image(systemName: "applelogo")
                    .font(.default22)
                    .foregroundColor(.ToofButtonColor)
            }
            .padding(.horizontal)
            
            //MARK: SearchView - Add Music Button
            Button {
                print("Press to ShowDocumentPicker")
                addButton()
            } label: {
                Image(systemName: "plus.rectangle.on.rectangle.fill")
                    .font(.default22)
                    .foregroundColor(.ToofButtonColor)
            }
        }
        .padding(.horizontal)
    }
}

struct SearchTopButtons_Previews: PreviewProvider {
    static var previews: some View {
        SearchTopButtons {
            
        } appleButton: {
            
        } addButton: {
            
        }
    }
}
