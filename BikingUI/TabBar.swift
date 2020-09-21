//
//  TabBar.swift
//  BikingUI
//
//  Created by Sagar Patel on 2020-09-15.
//

import SwiftUI

struct TabBar: View {
    @State private var selected = 0

    var body: some View {
        TabView(selection: $selected) {
            Start()
                .tabItem {
                    Image(systemName: selected == 0 ? "flame.fill" : "flame")
                }.tag(0)
            History()
                .tabItem {
                    Image(systemName: selected == 1 ? "chart.bar.fill" : "chart.bar")
                }.tag(1)
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
