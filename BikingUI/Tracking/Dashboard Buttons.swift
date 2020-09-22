//
//  Dashboard Buttons.swift
//  BikingUI
//
//  Created by Sagar on 2020-09-20.
//

import SwiftUI

struct Dashboard_Buttons_Pause: View {
    @Binding var isRunning: Bool

    var body: some View {
        ZStack {
            Circle()
                .shadow(radius: 3)
                .foregroundColor(.red)

            Image(systemName: isRunning ? "pause.fill" : "play.fill")
                .resizable()
                .foregroundColor(.white)
                .frame(width: 30, height: 30, alignment: .center)
                .font(.system(size: 30, weight: .heavy))
        }
        .frame(width: 100, height: 100, alignment: .center)
    }
}

struct Dashboard_Buttons_Stop: View {
    @Binding var isDone: Bool

    @State private var ticker = Ticker()
    @State private var isPressed: Bool = false
    @State private var timePassed: TimeInterval?

    private var timeLabel: String {
        let x = 3 - Int(timePassed ?? 0)
        return x > 0 ? "\(x)" : "1"
    }

    var body: some View {
        Button(action: {}) {
            ZStack {
                Circle()
                    .shadow(radius: 3)
                    .foregroundColor(.yellow)

                if isPressed {
                    Text(timeLabel)
                        .foregroundColor(.black)
                        .italic()
                        .frame(width: 30, height: 30, alignment: .center)
                        .font(.system(size: 50, weight: .heavy))

                } else {
                    Image(systemName: "stop.fill")
                        .resizable()
                        .foregroundColor(.white)
                        .frame(width: 30, height: 30, alignment: .center)
                        .font(.system(size: 30, weight: .heavy))
                }
            }
            .frame(width: 100, height: 100, alignment: .center)
        }
        .onLongPressGesture(minimumDuration: .infinity, maximumDistance: .infinity, pressing: { value in
            self.isPressed = value
            if value == true {
                self.timePassed = 0
                self.ticker.start(interval: 0.5)
            }

        }, perform: {})
        .onReceive(ticker.objectWillChange) { _ in
            guard self.isPressed else {
                self.ticker.stop()
                return
            }

            if self.timePassed?.isLess(than: 2) == false {
                withAnimation { isDone = true }
            }

            self.timePassed = self.ticker.timeIntervalSinceStarted
        }
    }
}

struct Dashboard_Buttons_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            Dashboard_Buttons_Stop(isDone: .constant(false))
        }
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
