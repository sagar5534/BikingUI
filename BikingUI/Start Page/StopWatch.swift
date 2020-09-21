//
//  StopWatch.swift
//  BikingUI
//
//  Created by Sagar on 2020-09-20.
//

import Foundation
import SwiftUI

class StopWatchManager: ObservableObject {
    @State var isRunning: Bool = false
    
    var totalTime = 0.0
    var movingTime = 0.0
    
    @Published var totalCounter = ""
    @Published var movingCounter = ""
    
    var TotalTimer = Timer()
    var MovingTimer = Timer()
    let formatter = DateComponentsFormatter()
    
    init() {
        formatter.unitsStyle = .positional
        formatter.includesApproximationPhrase = false
        formatter.includesTimeRemainingPhrase = false
        formatter.zeroFormattingBehavior = .pad
        formatter.allowedUnits = [.second, .minute, .hour]
    }
    
    func start() {
        TotalTimer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
            self.totalTime += 0.1
            self.totalCounter = self.formatter.string(from: self.totalTime)!
        }
        resume()
    }
    
    func pause() {
        MovingTimer.invalidate()
    }
    
    func resume() {
        MovingTimer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
            self.movingTime += 0.1
            self.movingCounter = self.formatter.string(from: self.movingTime)!
        }
    }
    
    func stop() {
        TotalTimer.invalidate()
        MovingTimer.invalidate()
    }
}
