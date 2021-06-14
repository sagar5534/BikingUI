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
                    .frame(width: 38, height: 38, alignment: .center)
                    .clipShape(Circle())
                    .padding(.bottom, 7)
            )
    }
}

struct InlineNavBar: ViewModifier {
    @State var title: String

    func body(content: Content) -> some View {
        content
            .navigationTitle(title)
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
