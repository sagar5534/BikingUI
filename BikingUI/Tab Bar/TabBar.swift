//
//  TabBar.swift
//  BikingUI
//
//  Created by Sagar Patel on 2020-09-15.
//

import SwiftUI

struct TabBar: View {
    
    let items: [BottomBarItem] = [
        BottomBarItem(icon: "house.fill", title: "Home", color: .purple),
        BottomBarItem(icon: "heart", title: "History", color: .pink),
        BottomBarItem(icon: "magnifyingglass", title: "Settings", color: .orange),
    ]
    @State public var selectedIndex: Int = 0
    
    
    var body: some View {
        
        ZStack {
            
            NavigationView {
                containedView()
            }
            
            VStack {
                Spacer()
                ZStack {
                    BottomBar(selectedIndex: $selectedIndex, items: items)
                }
            }
            
        }
        
    }
    
    func containedView() -> some View {
         switch selectedIndex {
         case 0: return AnyView(Start()).id("Start")
         case 1: return AnyView(History()).id("History")
         default: return AnyView(Start()).id("Start")
         }
    }
    
//    @State private var selected = 0
//
//    var body: some View {
//        TabView(selection: $selected) {
//            Start()
//                .tabItem {
//                    Image(systemName: selected == 0 ? "flame.fill" : "flame")
//                }.tag(0)
////            History()
////                .tabItem {
////                    Image(systemName: selected == 1 ? "chart.bar.fill" : "chart.bar")
////                }.tag(1)
//        }
//    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
