//
//  IRDb_MediaDataModel.swift
//  SwiftyIRDB_TPK
//
//  Created by Tanner Parker on 10/22/20.
//  Changes were made

import UIKit

class IRDb_MediaDataModel: Codable {
    var NFL: [Franchise]
}

class Franchise: Codable{
    let divisionName: String
    let teams: [Entry]
}

class Entry: Codable{
    let teamName: String
    let location: String
    let stadium: String
    let division: String
    let imageURL: String
    let superBowlWins: String
    let summary: String
    let coaching: [Cast]
}

class Cast: Codable{
    let coachName: String
    let role: String
}

