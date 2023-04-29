//
//  CustomTabBar.swift
//  TOOF Audio
//
//  Created by NomoteteS on 23.04.2023.
//

import SwiftUI
//TODO: TAbbar item string düzelt 
struct CustomTabBar: View {
    
    let tab: [ToofTabBar]
    @Binding var selection: ToofTabBar
    @Namespace var backgroundItem
    
    var body: some View {
        tabView
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    
    static var previews: some View {
        ZStack {
            Color.ToofBackgroundColor.ignoresSafeArea()
            CustomTabBar(tab: [.browse,.device,.search,.settings],
                         selection: .constant(.browse))
        }
    }
}


extension CustomTabBar {
    private func tabView(item: ToofTabBar) -> some View {
        VStack {
            Image(selection == item ? item.tabBarImageFilled : item.tabBarImage)
                .font(.subheadline)
            Text(item.tabBarTitle.locale())
                .font(.system(size: 10, weight: .semibold, design: .rounded))
        }
        .foregroundColor(selection == item ? .ToofTextColor : .ToofTextSoftColor)
        .padding(.vertical, 8)
        .frame(maxWidth: .infinity)
        .cornerRadius(10)
    }
    
    private func switchToTab(tab: ToofTabBar) {
        selection = tab
    }
    
    private var tabView: some View {
        HStack {
            ForEach(tab, id: \.self) { tab in
                tabView(item: tab)
                    .onTapGesture {
                        switchToTab(tab: tab)
                    }
            }
        }
        .padding(6)
        .background {
            Color.ToofPlaceholder.opacity(0.2).ignoresSafeArea(edges: .bottom)
                .padding(.top,9)
        }
    }
}
