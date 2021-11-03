//
//  Rain.swift
//  StatsDemoFinal
//
//  Created by student on 10/11/21.
// Apologies for such a late submission here professor I had to catch up
// in an A session class and fell behind here. 

import Foundation


struct Rain {
    //all measured in inches
    var rainSpring: Int
    var rainSummer: Int
    var rainFall: Int
    var rainWinter: Int
    //avg is in feet
    var avg: Double {
        get {
            return (Double(rainSpring + rainSummer + rainFall + rainWinter) / Double(12))
        }
    }
    
    static func loadRain()-> Rain {
        return Rain(rainSpring : 0, rainSummer: 0, rainFall: 0, rainWinter: 0)
    }
    
    func formattedAverage() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 3
        formatter.minimumFractionDigits = 1
        formatter.maximumIntegerDigits = 3
        let number = NSNumber(value: avg)
        if let str = formatter.string(from: number) {
            return str
        } else {
            return "nan"
        }
    }
}

