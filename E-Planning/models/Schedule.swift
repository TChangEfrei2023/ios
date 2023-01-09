//
//  File.swift
//  E-Planning
//
//  Created by user231510 on 1/9/23.
//

import Foundation

struct ScheduleRecords: Codable {
    let records: [Schedule]?
}

// Make the Published conformed to Decodable protocol
extension Published: Decodable where Value:Decodable {
    public init(from decoder: Decoder) throws {
        let decoded = try Value(from: decoder)
        self = Published(initialValue: decoded)
    }
}

struct Schedule: Codable {
    let id: String
    var fields: ScheduleFields
}


struct ScheduleFields: Codable {
    let activity: String
    let type: String
    let start: String
    let end: String
    let location: String
    let notes: String?
    enum CodingKeys: String, CodingKey {
        case activity = "Activity"
        case type = "Type"
        case start = "Start"
        case end = "End"
        case location = "Location"
        case notes = "Notes"
    }
}
