//
//  Dashboard.swift
//  BikingUI
//
//  Created by Sagar on 2020-09-19.
//

import SwiftUI
import SwiftUICharts

struct Dashboard: View {
    @Binding var isDone: Bool
    
    @State var isPaused: Bool = false

    @EnvironmentObject var Location: CoreLocation
    @EnvironmentObject var Timer: StopWatchManager

    var body: some View {
        VStack {
            
            if isPaused == false {
                Dashboard_Time(timer: Timer)
                Dashboard_Speed(Location: Location)
                Dashboard_Distance(Location: Location)
            }

            Dashboard_Controls()
            
        }
        .onAppear {
            Timer.start()
        }
    }
}

struct Dashboard_Previews: PreviewProvider {
    static var previews: some View {
        var Location = CoreLocation()
        var Timer = StopWatchManager()

        Dashboard(isDone: .constant(false))
            .environmentObject(Location)
            .environmentObject(Timer)
    }
}
