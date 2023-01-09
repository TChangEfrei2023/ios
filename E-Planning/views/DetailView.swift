//
//  DetailView.swift
//  E-Planning
//
//  Created by user231510 on 1/9/23.
//

import SwiftUI

struct DetailView: View {
    var schedule: Schedule
    
    init(schedule: Schedule) {
        self.schedule = schedule
    }
    
    var body: some View {
        VStack {
            VStack {
                Text(schedule.fields.activity)
                    .padding()
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .background(.yellow)
                    .cornerRadius(50)
                    
                VStack {
                    HStack {
                        Text("Start")
                            .bold()
                        Text(schedule.fields.start)
                    }
                    HStack {
                        Text("End")
                            .bold()
                        Text(schedule.fields.end)
                    }
                }
                .padding()
                .background(.cyan)
                .cornerRadius(10)
                .padding(10)
                
                VStack {
                    Text("At")
                    Text(schedule.fields.location)
                        .bold()
                        .foregroundColor(.red)
                }
                
                Spacer()
                
                ScrollView {
                    Text("Related notes")
                        .bold()
                        .font(.system(size:34))
                    Spacer()
                    Text(schedule.fields.notes ?? "No specific notes for this activity")
                }
                .padding()
                .cornerRadius(5)
            }
            .padding()
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(schedule: Schedule(
            id:"1",
            fields: ScheduleFields(
                activity: "Breakfast",
                type: "Meal",
                start:"8/2/2023 9:00am",
                end:"8/2/2023 9:30am",
                location:"President's dining hall",
                notes:"Belinda's going to need a projector for her presentation"
            )
        ))
    }
}

