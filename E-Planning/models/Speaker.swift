//
//  Speaker.swift
//  E-Planning
//
//  Created by user231510 on 1/9/23.
//

import Foundation

struct SpeakerRecords: Codable {
    let records: [Speaker]?
}

struct Speaker: Codable {
    let id: String
    let fields: SpeakerFields
}

struct SpeakerFields: Codable {
    let name: String
    let company: String
    let role: String
    let email: String
    let phone: String
    let confirmed: Bool
    enum CodingKeys: String, CodingKey {
        case name = "Name"
        case company = "Company"
        case role = "Role"
        case email = "Email"
        case phone = "Phone"
        case confirmed = "Confirmed"
    }
}
