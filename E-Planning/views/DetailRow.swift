//
//  DetailRow.swift
//  E-Planning
//
//  Created by user231510 on 1/9/23.
//

import Foundation
import SwiftUI

struct DetailRow: View {
    var schedule: Schedule
    
    var body: some View {
        HStack {
            Text(schedule.fields.activity)
        }
    }
}









struct DetailRow_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(schedule: Schedule(
            id:"1",
            fields: ScheduleFields(
                activity: "Breakfast",
                type: "Meal",
                start:"8/2/2023",
                end:"8/2/2023",
                location:"President's dining hall",
                notes:"Belinda's going to need a projector for her presentation"
            )
        ))
    }
}
