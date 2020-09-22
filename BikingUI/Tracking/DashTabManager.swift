//
//  DashTabManager.swift
//  BikingUI
//
//  Created by Sagar on 2020-09-19.
//

import SwiftUI

struct DashTabManager: View {
    @ObservedObject var Location = CoreLocation()
    @ObservedObject var Timer = StopWatchManager()

    @State private var selectedPage = 0
    @State var isDone = false

    var body: some View {
        if isDone {
            ActivityOverview()

        } else {
            TabView(selection: $selectedPage) {
                Dashboard(isDone: $isDone)
                    .tag(0)
                    .environmentObject(Location)
                    .environmentObject(Timer)

                DashMap(selectedTabViewPage: $selectedPage)
                    .tag(1)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .navigationBarHidden(true)
        }
    }
}

struct DashTabManager_Previews: PreviewProvider {
    static var previews: some View {
        DashTabManager()
    }
}
