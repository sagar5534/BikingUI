//
//  Dashboard Components.swift
//  BikingUI
//
//  Created by Sagar on 2021-05-14.
//

import SwiftUI


struct Dashboard_Time: View {
    
    @ObservedObject var timer: StopWatchManager
    @State var toggle: Bool = true
    
    var body: some View {
        
        Button(action: { toggle.toggle() }, label: {
            if toggle {
                LargeCountDown(value: $timer.movingLabel, desc: "Moving Time")
            } else {
                LargeCountDown(value: $timer.totalLabel, desc: "Total Time")
            }
        })
        
    }
    
}

struct Dashboard_Speed: View {
    
    @ObservedObject var Location = CoreLocation()
    @State var toggle: Bool = true
    
    var body: some View {
        
        Button(action: { toggle.toggle() }, label: {
            let label = "Km/h"

            if toggle {
                LargeText(value: $Location.avgSpeed, desc: "Average Speed \(label)", isDistance: false)
            } else {
                LargeText(value: $Location.curSpeed, desc: "Current Speed \(label)", isDistance: false)
            }
        })
        
    }
    
}


struct Dashboard_Distance: View {
    
    @ObservedObject var Location : CoreLocation
    
    var body: some View {
        
        LargeText(value: $Location.distance, desc: "Kilometers", isDistance: true)

    }
    
}

struct Dashboard_Controls: View {
    
    @State var isPaused: Bool = true

    var body: some View {
        
        VStack {
            HStack {
                
                Button(action: { isPaused.toggle() }) {
                    Dashboard_PauseButton(isPaused: $isPaused)
                        .padding()
                }
                
                Button(action: { isPaused.toggle() }) {
                    //TODO
                    Dashboard_StopButton(isDone: $isPaused)
                        .padding()
                }
                
            }
        }

    }
    
}


private struct LargeText: View {
    @Binding var value: Double
    @State var desc: String
    @State var isDistance: Bool

    var body: some View {
        VStack {
            let x = isDistance ? value.formatDistance(isKm: true).format() : value.formatSpeed(isKmph: true).format()

            Text(x)
                .font(Font.system(size: 120, weight: .heavy).monospacedDigit())
                .foregroundColor(.primary)
                .italic()
                .minimumScaleFactor(0.2)
                .lineLimit(1)

            Text(desc)
                .font(.callout)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
        }
        .padding()
    }
}

private struct LargeCountDown: View {
    @Binding var value: String
    @State var desc: String

    var body: some View {
        VStack {
            Text(value)
                .font(Font.system(size: 120, weight: .heavy).monospacedDigit())
                .foregroundColor(.primary)
                .italic()
                .minimumScaleFactor(0.2)
                .lineLimit(1)

            Text(desc)
                .font(.callout)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
        }
        .padding()
    }
}


struct Dashboard_Components_Previews: PreviewProvider {
    static var previews: some View {

        var Timer = StopWatchManager()
        var Location = CoreLocation()
        
        Dashboard_Time(timer: Timer)
            .previewLayout(.sizeThatFits)
            .onAppear {
                Timer.start()
            }
            
        Dashboard_Speed(Location: Location)
            .previewLayout(.sizeThatFits)
        Dashboard_Distance(Location: Location)
            .previewLayout(.sizeThatFits)

        
    }
}
