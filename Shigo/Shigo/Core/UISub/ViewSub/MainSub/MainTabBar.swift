//
//  MainTabBar.swift
//  Shigo
//
//  Created by NomoteteS on 11.03.2023.
//

import SwiftUI


enum tabs{
    case home,order,search,buy,profile
}

struct MainTabBar : View {
    
    @State var selectionTab : tabs = .home
    
    var body: some View {
        
        TabView(selection: $selectionTab) {
            HomeView()
                .tag(tabs.home)
                .tabItem {
                    Image(systemName: "house")
                }
            OrderView()
                .tag(tabs.order)
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
            SearchView()
                .tag(tabs.search)
                .tabItem {
                    Image(Imagements.Main.mainTab.rawValue)
                }
            BuyShiView()
                .tag(tabs.buy)
                .tabItem {
                    Image(systemName: "basket")
                }
            ProfileView()
                .tag(tabs.profile)
                .tabItem {
                    Image(systemName: "person")
                }
        }
        .background{
            
        }
        .tint(.shigoOrange)
    }
}

struct MainTabBar_Previews: PreviewProvider {
    static var previews: some View {
        MainTabBar()
    }
}
