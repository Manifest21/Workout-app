//
//  ContentView.swift
//  Workout app
//
//  Created by Łukasz Uranowski on 02/05/2020.
//  Copyright © 2020 Łukasz Uranowski. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let menu = Bundle.main.decode([TrainingSession].self, from: "trainingsData.json")
    
    
    var body: some View {
        NavigationView {
            List {
                Text("Hello")
                }
        }.navigationBarTitle("Menu")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
