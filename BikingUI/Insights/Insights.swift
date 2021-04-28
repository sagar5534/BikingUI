//
//  History.swift
//  BikingUI
//
//  Created by Sagar on 2020-09-16.
//

import SwiftUI


struct Insights: View {
    
    var body: some View {
        
        VStack {
            
            InsightScoreboard()
                .padding()
            
            Spacer()
            
        }
        
        .navigationTitle("Insights")
    }
}

struct History_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            Insights()
        }
    }
}
