//
//  Core.swift
//  SpaceX
//
//  Created by Loren Olson on 10/4/21.
//

import Foundation

// This project is based on the SpaceX REST API
// https://github.com/r-spacex/SpaceX-API


// Information about booster cores
// https://github.com/r-spacex/SpaceX-API/tree/master/docs/cores/v4

struct Core: Codable {
    
    var block: Int?
    var reuseCount: Int
    var rtlsAttemps: Int?
    var rtlsLandings: Int?
    var asdsAttemps: Int?
    var asdsLandings: Int?
    var lastUpdate: String?
    var launches: [String]
    var serial: String
    var status: String
 
    var id: String
}


