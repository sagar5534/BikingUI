//
//  Ticker.swift
//  BikingUI
//
//  Created by Sagar on 2020-09-24.
//

import Foundation

class Ticker: ObservableObject {
    var startedAt = Date()

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
