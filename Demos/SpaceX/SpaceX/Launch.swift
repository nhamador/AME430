//
//  Launch.swift
//  SpaceX
//
//  Created by Loren Olson on 10/6/21.
//

import Foundation


// This project is based on the SpaceX REST API
// https://github.com/r-spacex/SpaceX-API


// Launch data
// https://github.com/r-spacex/SpaceX-API/tree/master/docs/launches/v5

struct Launch: Decodable {
    var flightNumber: Int
    var name: String
    var links: Links
}

struct Links: Decodable {
    var patch: Patch
    var flickr: Flickr
    var presskit: String?
    var webcast: String?
    var article: String?
}

struct Patch: Decodable {
    var small: String
    var large: String
}

struct Flickr: Decodable {
    var small: [String]
    var original: [String]
}
