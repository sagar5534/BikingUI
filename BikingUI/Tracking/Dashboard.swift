//
//  Dashboard.swift
//  BikingUI
//
//  Created by Sagar on 2020-09-19.
//

import SwiftUI
import SwiftUICharts

struct Dashboard: View {
    @ObservedObject var Location = CoreLocation()
    @ObservedObject var timer = StopWatchManager()
    @State var speedToggle: Bool = true
    @State var isRunning: Bool = true
    @State var isStopping: Bool = false

    var body: some View {
        VStack {
            VStack {
                LargeCountDown(value: $timer.time, desc: "Moving Time")
                Spacer()

                Button(action: {
                    speedToggle.toggle()
                }, label: {
                    if speedToggle {
                        LargeText(value: $Location.avgSpeed, desc: "Average Speed Km/h")
                    } else {
                        LargeText(value: $Location.curSpeed, desc: "Current Speed Km/h")
                    }
                })

                Spacer()
                LargeText(value: $Location.distance, desc: "Kms")
                    .frame(maxWidth: .infinity)
            }
            .padding()

            VStack {
                HStack {
                    Button(action: {
                        isRunning.toggle()

                        if isRunning { timer.start() }
                        else { timer.pause() }

                    }) {
                        Dashboard_Buttons_Pause(isRunning: $isRunning)
                            .padding()
                    }

                    Dashboard_Buttons_Stop()
                        .padding()
                }
            }
        }
        .onAppear {
            timer.start()
        }
    }
}

private struct LargeText: View {
    @Binding var value: Double
    @State var desc: String

    var body: some View {
        VStack {
            Text(String(format: "%.2f", value))
                .font(Font.system(size: 120, weight: .heavy).monospacedDigit())
                .foregroundColor(Color.black)
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
                .foregroundColor(Color.black)
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

/// Helper "ticker" that will publish regular "objectWillChange" messages
class Ticker: ObservableObject {
    var startedAt: Date = Date()

    var timeIntervalSinceStarted: TimeInterval {
        return Date().timeIntervalSince(startedAt)
    }

    private var timer: Timer?
    func start(interval: TimeInterval) {
        stop()
        startedAt = Date()
        timer = Timer.scheduledTimer(withTimeInterval: interval, repeats: true) { _ in
            self.objectWillChange.send()
        }
    }

    func stop() {
        timer?.invalidate()
    }

    deinit {
        timer?.invalidate()
    }
}

struct Dashboard_Previews: PreviewProvider {
    static var previews: some View {
        Dashboard()
    }
}
