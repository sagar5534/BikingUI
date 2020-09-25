//
//  StopWatch.swift
//  BikingUI
//
//  Created by Sagar on 2020-09-20.
//

import Foundation
import SwiftUI

class StopWatchManager: ObservableObject {

    @Published var totalCounter = ""
    @Published var movingCounter = ""

    private var totalTime = 0.0
    private var movingTime = 0.0
    private var TotalTimer = Timer()
    private var MovingTimer = Timer()

    func start() {
        TotalTimer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
            self.totalTime += 0.1
            self.totalCounter = self.totalTime.toTime(pad: true)
        }
        resume()
    }

    func pause() {
        MovingTimer.invalidate()
    }

    func resume() {
        MovingTimer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
            self.movingTime += 0.1
            self.movingCounter = self.movingTime.toTime(pad: true)
        }
    }

    func stop() {
        TotalTimer.invalidate()
        MovingTimer.invalidate()
    }
}
