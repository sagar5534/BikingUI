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
                        .modifier(NavBar(title: "Insights"))
                }
                .tabItem {
                    Label("Insights", systemImage: "chart.bar.xaxis")
                }
                
                
                NavigationView {
                    Settings()
                        .modifier(NavBar(title: "Settings"))
                }
                .tabItem {
                    Label("Settings", systemImage: "gearshape.fill")
                }
            }
    }
    
}

struct NavBar: ViewModifier {
    
    @State var title: String
    
    func body(content: Content) -> some View {
        content
            .navigationTitle(title)
            .navigationBarTitleDisplayMode(.large)
            .navigationBarItems(leading:
                Image("profile")
                    .resizable()
                    .frame(width: 40, height: 40, alignment: .center)
                    .clipShape(Circle())
            )
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
