//
//  ViewModel.swift
//  E-Planning
//
//  Created by user231510 on 1/9/23.
//

import Foundation

struct ViewModel {
    func getSchedules() ->  [Schedule] {
        // Deal with async using group
        let group = DispatchGroup()
        var scheduleList : [Schedule] = []
        group.enter()
        let requestFactory = RequestFactory()
        requestFactory.getScheduleList { (errorHandle, schedules) in
            if let _ = errorHandle.errorType, let errorMessage =
                errorHandle.errorMessage {
                print(errorMessage)
            }
            else if let list = schedules, let schedule = list.last {
                print(schedule.id)
                scheduleList = list
                group.leave()
            }
            else {
                print("Error in fetching schedules")
            }
        }
        group.wait()
        return scheduleList
    }
}
	
