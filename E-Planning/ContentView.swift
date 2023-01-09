//
//  ContentView.swift
//  E-Planning
//
//  Created by user231510 on 1/7/23.
//

import SwiftUI
import UIKit
import Foundation

struct ContentView: View {
    @State var viewModel: ViewModel
    
    var body: some View {
        NavigationView {
            List(viewModel.getSchedules(), id: \.id) { schedule in
                NavigationLink(destination: DetailView(schedule: schedule)) {
                    DetailRow(schedule: schedule)
                }
            }
            .navigationTitle("Schedule")
       }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: ViewModel())
    }
}
