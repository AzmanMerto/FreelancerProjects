//
//  OrderView.swift
//  Shigo
//
//  Created by NomoteteS on 10.03.2023.
//

import SwiftUI

struct OrderView: View {
    var body: some View {
        ZStack {
            Image(Imagements.Main.orderView.rawValue)
                .resizable()
                .scaledToFit()
            
            Rectangle()
                .frame(height: 200)
                .opacity(0.5)
            
            Text("Bakım aşamasında 🚧")
                .font(.largeTitle.bold())
                .foregroundColor(.white)
        }
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}
