//
//  CustomPresentedSheetsView.swift
//  Metin2AddServerApp
//
//  Created by NomoteteS on 16.03.2023.
//

import SwiftUI

struct sheet1: View {
    var body: some View {
        CustomPresentedSheetsView(buttonText: "", data: Data())
    }
}



struct CustomPresentedSheetsView: View {
    
    @Environment(\.dismiss) var Dismiss
    var buttonText: String
    var data : Data
    
    var body: some View {
        ZStack {
            Color.MetinBackground
                .ignoresSafeArea()
            LazyVStack {
                Section {
                    ForEach(data, id: \.self) { server in
                        
                    }
                } header: {
                    RegularButton(buttonText: buttonText) {
                        Dismiss()
                    }
                }
            }
        }
    }
}

struct CustomPresentedSheetsView_Previews: PreviewProvider {
    static var previews: some View {
        CustomPresentedSheetsView(buttonText: "asdasdasdsaasd",data: Data())
    }
}
