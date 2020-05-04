//
//  NewTraining.swift
//  Workout app
//
//  Created by Łukasz Uranowski on 03/05/2020.
//  Copyright © 2020 Łukasz Uranowski. All rights reserved.
//

import SwiftUI
import Combine


struct NewTraining: View {
    @ObservedObject var order = FetchToDo()
    @State private var testos: Double = 0
    
    var body: some View {
        NavigationView{
            Form {
                    Picker(selection: $order.title, label: Text("Select exercise")) {
                        ForEach(0 ..< FetchToDo.titles.count) {
                            Text(FetchToDo.titles[$0]).tag($0)
                        }
                    }
            .pickerStyle(SegmentedPickerStyle())
                
                Slider(value: $testos, in: 5...100) {
                    Text("Number of reps: \(testos)")
                }
            }
        }
    .navigationBarTitle(Text("Add workout"))
    }
}


struct NewTraining_Previews: PreviewProvider {
    static var previews: some View {
        NewTraining()
    }
}
