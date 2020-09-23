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
    @Published var totalCounter = ""
    @Published var movingCounter = ""

    private var totalTime = 0.0
    private var movingTime = 0.0
    private var TotalTimer = Timer()
    private var MovingTimer = Timer()
    private let formatter = DateComponentsFormatter()

    init() {
        formatter.unitsStyle = .positional
        formatter.includesApproximationPhrase = false
        formatter.includesTimeRemainingPhrase = false
        formatter.zeroFormattingBehavior = .pad
        formatter.allowedUnits = [.second, .minute, .hour]
    }

    func start() {
        isRunning = true
        TotalTimer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
            self.totalTime += 0.1
            self.totalCounter = self.formatter.string(from: self.totalTime)!
        }
        resume()
    }

    func toggle() {
        isRunning.toggle()
        if isRunning {
            resume()
        } else {
            pause()
        }
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
        isRunning = false
        TotalTimer.invalidate()
        MovingTimer.invalidate()
    }
}