//
//  StopWatch.swift
//  BikingUI
//
//  Created by Sagar on 2020-09-20.
//

import SwiftUI
import Foundation

class StopWatchManager: ObservableObject {
    
    @Published var isRunning: Bool = false
    var secondsElapsed = 0.0
    @Published var time = ""
    
    var timer = Timer()
    let formatter = DateComponentsFormatter()
    
    init() {
        
        formatter.unitsStyle = .positional
        formatter.includesApproximationPhrase = false
        formatter.includesTimeRemainingPhrase = false
        formatter.zeroFormattingBehavior = .pad
        formatter.allowedUnits = [.second, .minute, .hour]
        
    }
    
    func start() {
        isRunning = true
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            self.secondsElapsed += 0.1
            self.time = self.formatter.string(from: self.secondsElapsed)!
        }
    }
    
    func pause() {
        timer.invalidate()
        isRunning = false
    }
    
}
