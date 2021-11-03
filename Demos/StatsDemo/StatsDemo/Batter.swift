//
//  Batter.swift
//  StatsDemo
//
//  Created by student on 9/15/21.
//

import Foundation

struct Batter {
    var atBats: Int
    var singles: Int
    var doubles: Int
    var triples: Int
    var homeRuns: Int
    var avg : Double{
        get{
            guard atBats > 0 else {return 0}
        return Double(singles + doubles + triples + homeRuns) / Double(atBats)
    }
    }
    // var name : String // klllop
    
    static func loadBatter() -> Batter {
    return Batter(atBats: 0, singles: 0, doubles: 0, triples: 0, homeRuns: 0)
    }
}
