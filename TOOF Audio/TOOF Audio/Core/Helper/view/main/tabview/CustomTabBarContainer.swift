//
//  CustomTabBarContainer.swift
//  TOOF Audio
//
//  Created by NomoteteS on 23.04.2023.
//

import SwiftUI

struct CustomTabBarContainer<Content: View> : View {
    
    @Binding var selection: ToofTabBar
    let content: Content
    @State private var tabs: [ToofTabBar] = []
    
    
    init(selection: Binding<ToofTabBar>,
         @ViewBuilder content: () -> Content,
         musicName: String = "No Music") {
        self._selection = selection
        self.content = content()
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            content
                .ignoresSafeArea()
            VStack(spacing: 0) {
                TapBarPlayerView()
                CustomTabBar(tab: tabs, selection: $selection)
            }                
        }
        .onPreferenceChange(customTabbarItemsPreferenceKey.self) { value in
            self.tabs = value
        }
    }
}

struct CustomTabBarContainer_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBarContainer(selection: .constant(.device)) {
            Color.ToofBackgroundColor
                .tabBarItem(item: .device, selection: .constant(.device))
        }
    }
}


struct customTabbarItemsPreferenceKey: PreferenceKey {
    static let defaultValue: [ToofTabBar] = []
    
    static func reduce(value: inout [ToofTabBar], nextValue: () -> [ToofTabBar]) {
        value += nextValue()
    }
}

struct TabBarItemViewModifier: ViewModifier {
    
    let tab: ToofTabBar
    @Binding var selection: ToofTabBar
    
    func body(content: Content) -> some View {
        content
            .opacity(selection == tab ? 1 : 0)
            .preference(key: customTabbarItemsPreferenceKey.self, value: [tab])
    }
}
