//
//  File.swift
//  E-Planning
//
//  Created by user231510 on 1/9/23.
//

import Foundation

struct Response: Codable {
    let id: String
    let deleted: Bool
}

struct ErrorResponse: Codable {
    let error: String
}

enum RequestType: String {
    case get = "GET"
    case post = "POST"
    case delete = "DELETE"
}

enum CustomError: Error {
    case requestError
    case statusCodeError
    case parsingError
}
