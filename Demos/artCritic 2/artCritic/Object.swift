//
//  Object.swift
//  artCritic
//
//  Created by student on 10/15/21.
//

import Foundation

struct Object: Codable {
    var objectID: Int?
    /*
    var isHighlight: Bool?
    var accessionNumber: String?
    var accessionYear: String?
    var isPublicDomain: Bool?
 */
    var primaryImage: String
/*
    var primaryImageSmall: String?
    var additionalImages: [String?]
    var constituents: [String?] //not sure since it is array of objects so im doing string?
    var department: String?
    var objectName : String?
    */
   var title: String //= nil
    /*
    var culture: String?
    var period: String?
    var dynasty: String?
    var reign: String?
    var portfolio: String?
    var artistRole: String?
    var artistPrefix: String?
    var artistDisplayName: String?
    var artistDisplayBio: String?
    var artistSuffix: String?
    var artistAlphaSort: String?
    var artistNationality: String?
    var artistBeginDate: String?
    var artistEndDate: String?
    var artistGender: String?
    var artistWikidata_URL: String?
    var artistULAN_URL: String?
    var objectDate: String?
    var objectBeginDate: Int?
    var objectEndDate: Int?
    var medium: String?
    var dimensions: String?
    var dimensionsParsed: Float?
    var measurements: [String?] // not sure since array of objects
    var creditLine : String?
    var geographyType: String?
    var city: String?
    var state: String?
    var county: String?
    var region: String?
    var subregion: String?
    var locale: String?
    var locus: String?
    var excavation: String?
    var river: String?
    var classification: String?
    var rightsAndReproduction: String?
    var linkResource: String?
    var metadataDate : String? //was datetime in thing
    var repository: String?
    var objectURL: String?
    var tags: [String?] //not sure since it is array of Objects
    var objectWikidata_URL: String?
    var isTimelineWork: Bool?
    var GalleryNumber: String?
 */
    
}
/*
{
    "objectID": 45734,
    "isHighlight": false,
    "accessionNumber": "36.100.45",
    "accessionYear": "1936",
    "isPublicDomain": true,
    "primaryImage": "https://images.metmuseum.org/CRDImages/as/original/DP251139.jpg",
    "primaryImageSmall": "https://images.metmuseum.org/CRDImages/as/web-large/DP251139.jpg",
    "additionalImages": [
        "https://images.metmuseum.org/CRDImages/as/original/DP251138.jpg",
        "https://images.metmuseum.org/CRDImages/as/original/DP251120.jpg"
    ],
    "constituents": [
        {
            "constituentID": 11986,
            "role": "Artist",
            "name": "Kiyohara Yukinobu",
            "constituentULAN_URL": "http://vocab.getty.edu/page/ulan/500034433",
            "constituentWikidata_URL": "https://www.wikidata.org/wiki/Q11560527",
            "gender": "Female"
        }
    ],
    "department": "Asian Art",
    "objectName": "Hanging scroll",
    "title": "Quail and Millet",
    "culture": "Japan",
    "period": "Edo period (1615–1868)",
    "dynasty": "",
    "reign": "",
    "portfolio": "",
    "artistRole": "Artist",
    "artistPrefix": "",
    "artistDisplayName": "Kiyohara Yukinobu",
    "artistDisplayBio": "Japanese, 1643–1682",
    "artistSuffix": "",
    "artistAlphaSort": "Kiyohara Yukinobu",
    "artistNationality": "Japanese",
    "artistBeginDate": "1643",
    "artistEndDate": "1682",
    "artistGender": "Female",
    "artistWikidata_URL": "https://www.wikidata.org/wiki/Q11560527",
    "artistULAN_URL": "http://vocab.getty.edu/page/ulan/500034433",
    "objectDate": "late 17th century",
    "objectBeginDate": 1667,
    "objectEndDate": 1682,
    "medium": "Hanging scroll; ink and color on silk",
    "dimensions": "46 5/8 x 18 3/4 in. (118.4 x 47.6 cm)",
    "measurements": [
        {
            "elementName": "Overall",
            "elementDescription": null,
            "elementMeasurements": {
                "Height": 118.4,
                "Width": 47.6
            }
        }
    ],
    "creditLine": "The Howard Mansfield Collection, Purchase, Rogers Fund, 1936",
    "geographyType": "",
    "city": "",
    "state": "",
    "county": "",
    "country": "",
    "region": "",
    "subregion": "",
    "locale": "",
    "locus": "",
    "excavation": "",
    "river": "",
    "classification": "Paintings",
    "rightsAndReproduction": "",
    "linkResource": "",
    "metadataDate": "2020-09-14T12:26:37.48Z",
    "repository": "Metropolitan Museum of Art, New York, NY",
    "objectURL": "https://www.metmuseum.org/art/collection/search/45734",
    "tags": [
        {
            "term": "Birds",
            "AAT_URL": "http://vocab.getty.edu/page/aat/300266506",
            "Wikidata_URL": "https://www.wikidata.org/wiki/Q5113"
        }
    ],
    "objectWikidata_URL": "https://www.wikidata.org/wiki/Q29910832",
    "isTimelineWork": false,
    "GalleryNumber": ""
}
*/
