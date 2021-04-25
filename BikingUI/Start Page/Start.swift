//
//  Start.swift
//  BikingUI
//
//  Created by Sagar Patel on 2020-09-14.
//

import SwiftUI
import UIKit

struct Start: View {
    
    @StateObject var model = Start_VModel.sharedInstance
    
    var body: some View {
    
        VStack {
            Text(model.name)
        }
        .navigationTitle("Get Biking 🚴‍♂️")
        .accentColor(.orange)
        
    }
    
}

struct Start_Previews: PreviewProvider {
    static var previews: some View {
        Start()
            .previewDevice("iPhone 11 Pro")
    }
}
