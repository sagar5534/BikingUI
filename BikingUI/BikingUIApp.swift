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
    
    init() {
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            var firebaseManager = FirebaseManager()

            TabBar()
                .environmentObject(firebaseManager)
            
        }
    }
}

struct BikingUIApp_Previews: PreviewProvider {
    static var previews: some View {
        var firebaseManager = FirebaseManager()

        TabBar()
            .environmentObject(firebaseManager)

    }
}
