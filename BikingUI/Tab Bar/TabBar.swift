//
//  TabBar.swift
//  BikingUI
//
//  Created by Sagar Patel on 2020-09-15.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView {
            NavigationView {
                Start()
            }
            .tabItem {
                Label("Home", systemImage: "house.fill")
            }

            NavigationView {
                Insights()
            }
            .tabItem {
                Label("Insights", systemImage: "chart.bar.xaxis")
            }

            NavigationView {
                Events()
                    .modifier(NavBar(title: "Events"))
            }
            .tabItem {
                Label("Events", systemImage: "person.3.fill")
            }
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
