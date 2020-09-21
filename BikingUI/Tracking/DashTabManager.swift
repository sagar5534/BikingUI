//
//  DashTabManager.swift
//  BikingUI
//
//  Created by Sagar on 2020-09-19.
//

import SwiftUI

struct DashTabManager: View {
    @State private var selectedPage = 0

    var body: some View {
        TabView(selection: $selectedPage) {
            Dashboard().tag(0)
            DashMap(selectedPage: $selectedPage).tag(1)
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        .navigationBarHidden(true)
    }
}

struct DashTabManager_Previews: PreviewProvider {
    static var previews: some View {
        DashTabManager()
    }
}
