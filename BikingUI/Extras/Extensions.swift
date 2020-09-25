//
//  Extensions.swift
//  BikingUI
//
//  Created by Sagar on 2020-09-24.
//

import Foundation
import FirebaseFirestore

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
    
    func formatDistance(isKm : Bool) -> Double{
        return (self / (isKm ? 1000 : 1609))
    }

}

extension Timestamp {
    
    func format() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.doesRelativeDateFormatting = true
        return formatter.string(from: self.dateValue())
    }
}
