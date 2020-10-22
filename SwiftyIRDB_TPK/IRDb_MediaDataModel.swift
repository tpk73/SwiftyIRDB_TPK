//
//  IRDb_MediaDataModel.swift
//  SwiftyIRDB_TPK
//
//  Created by Tanner Parker on 10/22/20.
//

import UIKit

class IRDb_MediaDataModel: Codable {
    var franchise: [Franchise]
}

class Franchise: Codable{
    let franchiseName: String
    let entries: [Entry]
}

class Entry: Codable{
    let name: String
    let format: String
    let yearStart: String
    let yearEnd: String?
    let episodes: Int?
    let studio: String?
    let network: String?
    let imageURL: String
    let description: String
    let summary: String
    let starring: [Cast]
}

class Cast: Codable{
    let actorName: String
    let role: String
}

