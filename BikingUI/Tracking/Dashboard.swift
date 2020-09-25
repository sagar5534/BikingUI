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

    @State var speedToggle: Bool = true
    @State var timeToggle: Bool = true
    @State var isTimerRunning: Bool = true

    @EnvironmentObject var Location: CoreLocation
    @EnvironmentObject var Timer: StopWatchManager

    @EnvironmentObject var firebaseManager: FirebaseManager

    var body: some View {
        VStack {
            VStack {
                Button(action: {
                    timeToggle.toggle()
                }, label: {
                    if timeToggle {
                        LargeCountDown(value: $Timer.movingCounter, desc: "Moving Time")
                    } else {
                        LargeCountDown(value: $Timer.totalCounter, desc: "Total Time")
                    }
                })

                Spacer()

                Button(action: {
                    speedToggle.toggle()
                }, label: {
                    let label = firebaseManager.user.isKm ? "Km/h" : "Mi/h"
                             
                    if speedToggle {
                        LargeText(value: $Location.avgSpeed, desc: "Average Speed \(label)", isDistance: false)
                    } else {
                        LargeText(value: $Location.curSpeed, desc: "Current Speed \(label)", isDistance: false)
                    }
                })

                Spacer()
                LargeText(value: $Location.distance, desc: (firebaseManager.user.isKm ? "Kilometers" : "Miles"), isDistance: true)
                    .frame(maxWidth: .infinity)
            }
            .padding()

            VStack {
                HStack {
                    Button(action: {
                        isTimerRunning.toggle()
                        isTimerRunning ? Timer.resume() : Timer.pause()
                    }) {
                        Dashboard_Buttons_Pause(isRunning: $isTimerRunning)
                            .padding()
                    }

                    Dashboard_Buttons_Stop(isDone: $isDone)
                        .padding()
                }
            }
        }
        .onAppear {
            Timer.start()
        }
    }
}

private struct LargeText: View {
    @Binding var value: Double
    @State var desc: String
    @State var isDistance: Bool
    @EnvironmentObject var firebaseManager: FirebaseManager

    var body: some View {
        VStack {
            
            let x = isDistance ? value.formatDistance(isKm: firebaseManager.user.isKm).format() : value.formatSpeed(isKmph: firebaseManager.user.isKm).format()
            
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

struct Dashboard_Previews: PreviewProvider {
    static var previews: some View {
        Dashboard(isDone: .constant(false))
    }
}
