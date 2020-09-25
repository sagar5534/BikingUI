//
//  StopWatch.swift
//  BikingUI
//
//  Created by Sagar on 2020-09-20.
//

import Foundation
import SwiftUI

class StopWatchManager: ObservableObject {

    @Published var totalLabel = ""
    @Published var movingLabel = ""

    var totalTime = 0.0
    var movingTime = 0.0
    
    private var TotalTimer = Timer()
    private var MovingTimer = Timer()

    func start() {
        TotalTimer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
            self.totalTime += 0.1
            self.totalLabel = self.totalTime.toTime(pad: true)
        }
        resume()
    }

    func pause() {
        MovingTimer.invalidate()
    }

    func resume() {
        MovingTimer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
            self.movingTime += 0.1
            self.movingLabel = self.movingTime.toTime(pad: true)
        }
    }

    func stop() {
        TotalTimer.invalidate()
        MovingTimer.invalidate()
    }
}
