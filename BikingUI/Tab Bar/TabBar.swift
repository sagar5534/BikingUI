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
        BottomBarItem(icon: "chart.bar.xaxis", title: "Insights", color: .pink),
        BottomBarItem(icon: "gearshape.fill", title: "Settings", color: .orange),
    ]
    @State public var selectedIndex: Int = 0
    
    var body: some View {
        VStack {
            NavigationView {
                containedView()
            }
            Spacer()
            BottomBar(selectedIndex: $selectedIndex, items: items)
        }
    }
    
    func containedView() -> some View {
         switch selectedIndex {
         case 0: return AnyView(Start()).id("Start")
         case 1: return AnyView(Insights()).id("History")
         default: return AnyView(Start()).id("Start")
         }
    }

}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
