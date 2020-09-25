//
//  Extensions.swift
//  BikingUI
//
//  Created by Sagar on 2020-09-24.
//

import Foundation

extension Double {
    
    func toTime(pad: Bool) -> String {
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .positional
        formatter.includesApproximationPhrase = false
        formatter.includesTimeRemainingPhrase = false
        if pad{ formatter.zeroFormattingBehavior = .pad }
        formatter.allowedUnits = [.second, .minute, .hour]
        return formatter.string(from: self) ?? ""
    }
    
    func format() -> String{
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        return formatter.string(for: self) ?? ""
    }
}
