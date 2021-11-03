//
//  Batter.swift
//  StatsDemo
//
//  Created by student on 9/15/21.
//

import Foundation
import Cocoa

struct Batter {
    var atBats: Int
    var singles: Int
    var doubles: Int
    var triples: Int
    var homeRuns: Int
    var walks: Int
    var hitByPitches: Int
    var sacrifices: Int
    
    var avg : Double{
        get{
            guard atBats > 0 else {return 0}
        return Double(singles + doubles + triples + homeRuns) / Double(atBats)
        }
    }
    // var name : String // klllop
    
    var ops: Double {
        get {
            let hits = singles + doubles + triples + homeRuns
            let opprotunities = atBats + walks + sacrifices + hitByPitches
            var obp = 0.0
            if(opprotunities > 0 )
            {
                obp = Double(hits + walks + hitByPitches) / Double(opprotunities)
            }
            var slg = 0.0
            if atBats > 0 {
                let totalBases = singles + (double * 2) + (triples * 3) + (homeRuns * 4)
                slg = Double(totalBases) / Double(atBats)
            }
            return obp + slg
        }
    }
    static func loadBatter() -> Batter {
        return Batter(atBats: 0, singles: 0, doubles: 0, triples: 0, homeRuns: 0, walks : 1, hitByPitches: 2, sacrifices : 3)
    }
    func formattedAverage() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 3
        formatter.minimumFractionDigits = 3
        formatter.maximumIntegerDigits = 0
        let number = NSNumber(value : avg)
        if let str = formatter.string(from: number){
            return str
        }
        else {
            return "nan"
        }
    }
    func formattedOPS() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 4
        formatter.minimumFractionDigits = 4
        formatter.maximumIntegerDigits = 1
        formatter.maximumIntegerDigits = 1
        let number = NSNumber(value : avg)
        if let str = formatter.string(from: number){
            return str
        }
        else {
            return "nan"
        }
    }
    static let DocumentsDirectory = FileManager.default.urls(forL .documentDirectory, in: .userDomainMask).first!
    static let BatterArchiveURL = DocumentsDirectory.appendingPathComponent("batter").appendingPathExtension("plist")
    static func save(batter: Batter, url: URL)
    {
        let encoder = PropertyListEncoder()
        let codedBatter = try? encoder.encode(batter)
        try? codedBatter?.write(to: url)
    }
}


