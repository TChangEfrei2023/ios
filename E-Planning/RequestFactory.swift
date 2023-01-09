//
//  RequestFactory.swift
//  E-Planning
//
//  Created by user231510 on 1/9/23.
//

import Foundation

protocol RequestFactoryProtocol {
    func createRequest(urlStr: String, requestType: RequestType, params:[String]?) -> URLRequest
    
    func getScheduleList(callback: @escaping ((errorType: CustomError?, errorMessage: String?), [Schedule]?) -> Void)
    func getSpeakerList(callback: @escaping ((errorType: CustomError?, errorMessage: String?), [Speaker]?) -> Void)
}

private let scheduleUrlStr = "https://api.airtable.com/v0/appLxCaCuYWnjaSKB/tblon3PzkaCkPGUnr"
private let speakerUrlStr = "https://api.airtable.com/v0/appLxCaCuYWnjaSKB/tbl2hICf6XwPGRTzz"

class RequestFactory: RequestFactoryProtocol {
    internal func createRequest(urlStr: String, requestType: RequestType,params: [String]?) -> URLRequest {
        var url: URL = URL(string: urlStr)!
        if let params = params {
            var urlParams = urlStr
            for param in params {
                urlParams = urlParams + "/" + param
            }
            print(urlParams)
            url = URL(string: urlParams)!
        }
        var request = URLRequest(url: url)
        request.timeoutInterval = 100
        request.httpMethod = requestType.rawValue
        let accessToken = "keymaCPSexfxC2hF9"
        request.setValue("Bearer \(accessToken)", forHTTPHeaderField:"Authorization")
        return request
    }
    
    func getScheduleList(callback: @escaping ((errorType: CustomError?,errorMessage: String?), [Schedule]?) -> Void) {
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: createRequest(urlStr:scheduleUrlStr,requestType: .get,params: nil)) {
            (data, response, error) in
            if let data = data, error == nil {
                if let responseHttp = response as? HTTPURLResponse {
                    if responseHttp.statusCode == 200 {
                        if let response = try?
                            JSONDecoder().decode(ScheduleRecords.self, from: data) {
                                callback((nil, nil), response.records)
                            }
                        else {
                            callback((CustomError.parsingError, "parsingerror"), nil)
                        }
                    }
                    else {
                        callback((CustomError.statusCodeError, "status code: \(responseHttp.statusCode)"), nil)
                    }
                }
            }
            else {
                callback((CustomError.requestError,error.debugDescription), nil)
            }
        }
        task.resume()
    }
    
    func getSpeakerList(callback: @escaping ((errorType: CustomError?,errorMessage: String?), [Speaker]?) -> Void) {
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: createRequest(urlStr:speakerUrlStr,requestType: .get,params: nil)) {
            (data, response, error) in
            if let data = data, error == nil {
                if let responseHttp = response as? HTTPURLResponse {
                    if responseHttp.statusCode == 200 {
                        if let response = try?
                            JSONDecoder().decode(SpeakerRecords.self, from: data) {
                                callback((nil, nil), response.records)
                            }
                        else {
                            callback((CustomError.parsingError, "parsingerror"), nil)
                        }
                    }
                    else {
                        callback((CustomError.statusCodeError, "status code: \(responseHttp.statusCode)"), nil)
                    }
                }
            }
            else {
                callback((CustomError.requestError,error.debugDescription), nil)
            }
        }
        task.resume()
    }
}
