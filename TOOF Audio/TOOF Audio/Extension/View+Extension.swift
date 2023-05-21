//
//  View+Extension.swift
//  TOOF Audio
//
//  Created by NomoteteS on 18.04.2023.
//

import SwiftUI

extension View {
    func dw(_ double: Double) -> Double {
        let bounds = UIScreen.main.bounds.width
        return bounds * double
    }
    
    func dh(_ double: Double) -> Double {
        let bounds = UIScreen.main.bounds.height
        return bounds * double
    }
    
    func hideNavigationBar() -> some View {
        self
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            .navigationViewStyle(StackNavigationViewStyle())
    }
    
    func hideAndDisableButton(_ Bool: Bool) -> some View {
        self
            .disabled(Bool)
            .opacity(Bool ? 0 : 1)
    }
    
    func dismiss() {
        @Environment(\.dismiss) var dismiss
        
        do {
            try dismiss()
        } catch { }
    }
    
    func line() -> some View {
        Rectangle()
            .frame(height: 1)
            .foregroundColor(.ToofTextColor).opacity(0.7)
            .padding(.vertical)
    }
    
    func tabBarItem(item: ToofTabBar,selection: Binding<ToofTabBar>) -> some View {
        self
            .modifier(TabBarItemViewModifier(tab: item, selection: selection))
    }
    
    func openSettings() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            let settingsURL = URL(string: UIApplication.openSettingsURLString)
            UIApplication.shared.open(settingsURL!)
        }
    }
}
