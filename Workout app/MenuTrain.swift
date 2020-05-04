//
//  MenuTrain.swift
//  Workout app
//
//  Created by Łukasz Uranowski on 02/05/2020.
//  Copyright © 2020 Łukasz Uranowski. All rights reserved.
//


import SwiftUI
import Foundation
import Combine




struct Todo: Codable, Identifiable {
    public var id: Int
    public var title: String
    public var date: String
    public var reps: Int
}





struct MenuTrain: View {
    @ObservedObject var fetch = FetchToDo()
    
    var body: some View {
        NavigationView {
                List(fetch.todos) { todo in
                    VStack(alignment: .leading) {
                        Text(todo.date)
                            .font(.system(size: 17))
                            .foregroundColor(Color.blue)
                        HStack(alignment: .firstTextBaseline) {
                            Text("Exercise:")
                                .fontWeight(.light)
                            Text(todo.title)
                                .fontWeight(.regular)
                                .foregroundColor(Color.red)
                            Text("|  Reps:")
                                .fontWeight(.light)
                            Text(String(todo.reps))
                                .foregroundColor(Color.red)
                        }
                        .font(.system(size: 13))
                    }
                }
                .navigationBarTitle("Training history", displayMode: .inline)
        }
        .padding(.top, -1)
    }
}

