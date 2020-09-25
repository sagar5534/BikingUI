//
//  BikingUIApp.swift
//  BikingUI
//
//  Created by Sagar Patel on 2020-09-14.
//

import SwiftUI
import Firebase


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
                .onAppear{
                    firebaseManager.fetchData()
                }
        }
    }
}
