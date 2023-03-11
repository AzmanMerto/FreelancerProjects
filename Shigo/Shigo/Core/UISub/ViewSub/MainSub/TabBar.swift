//
//  TabBar.swift
//  Shigo
//
//  Created by NomoteteS on 10.03.2023.
//

import SwiftUI


struct TabBar: View {
    
    @State var isHomeChanged = true
    @State var isMagnifyChanged = false
    @State var isBasketChanged = false
    @State var isPersonChanged = false

    func changeIconColor(t1 type1: Bool, t2 type2: Bool, t3 type3: Bool, t4 type4: Bool) {
        self.isHomeChanged = type1
        self.isMagnifyChanged = type2
        self.isBasketChanged = type3
        self.isPersonChanged = type4
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 40)
                .foregroundColor(.shigoTextGray)
            HStack {
                Spacer()
                TabButton(isChanged: $isHomeChanged, systemImage: "house") {
                    changeIconColor(t1: true, t2: false, t3: false, t4: false)
                }
                
                Spacer()
                TabButton(isChanged: .constant(false), systemImage: "magnifyingglass") {
                    
                }
                ZStack {
                    Button {
                        
                    } label: {
                        Image(Imagements.Main.mainTab.rawValue)
                            .resizable()
                            .frame(width: 60,height: 50)
                    }
                }
                .padding(.horizontal,40)
                TabButton(isChanged: .constant(false), systemImage: "basket") {
                    
                }
                Spacer()
                TabButton(isChanged: .constant(false), systemImage: "person.circle") {
                    
                }
                Spacer()
            }
        }
        .padding(.horizontal)
        .frame(height: 70)
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}

private struct TabButton: View {
    
    @Binding var isChanged : Bool
    var systemImage: String
    var action: () -> ()
    
    var body: some View {
        Button {
            action()
        } label: {
            Image(systemName: systemImage)
        }
        .tint(isChanged ? Color.shigoOrange : Color.shigoDarkTextGray)
    }
}

