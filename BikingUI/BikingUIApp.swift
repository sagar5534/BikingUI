//
//  BikingUIApp.swift
//  BikingUI
//
//  Created by Sagar Patel on 2020-09-14.
//

import Firebase
import SwiftUI

@main
struct BikingUIApp: App {
    @StateObject var core = CoreData.sharedInstance

    init() {
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
//            Start()
            TabBar()
//                .environmentObject(core)
        }
    }
}

struct BikingUIApp_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
