//
//  connectSelections.swift
//  TOOF Audio
//
//  Created by NomoteteS on 20.04.2023.
//

import SwiftUI

struct connectSelections: View {
    
    var connect: ConnectSection
    @Binding var isSelected: Bool
    var action: () -> ()
    
    var body: some View {
        Button {
            action()
            isSelected.toggle()
        } label: {
            ZStack {
                Text(connect.connectString)
                    .foregroundColor(isSelected ? .ToofTextColor : .ToofPlaceholder)
                    .font(.default13 ).fontWeight(.semibold)
                    .minimumScaleFactor(0.7)
                RoundedRectangle(cornerRadius: 10)
                    .stroke(isSelected ? Color.ToofTextColor : Color.ToofPlaceholder)
                    .frame(height: dh(0.07))
            }
        }
    }
}

struct connectSelections_Previews: PreviewProvider {
    static var previews: some View {
        
        let connectItem: ConnectSection =
        ConnectSection(connectString: "Wifi", tag: 0)
        
        ZStack {
            Color.ToofBackgroundColor.ignoresSafeArea()
            connectSelections(connect: connectItem, isSelected: .constant(false)) {
                
            }
        }
    }
}
