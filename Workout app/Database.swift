//
//  Database.swift
//  Workout app
//
//  Created by Łukasz Uranowski on 04/05/2020.
//  Copyright © 2020 Łukasz Uranowski. All rights reserved.
//

import SwiftUI
import Combine

class FetchToDo: ObservableObject {
    @Published var todos = [Todo]()
     
    init() {
        let url = URL(string: "https://raw.githubusercontent.com/Manifest21/Workout-app/master/Workout%20app/trainingsData.json")!
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            do {
                if let todoData = data {
                    let decodedData = try JSONDecoder().decode([Todo].self, from: todoData)
                    DispatchQueue.main.async {
                        self.todos = decodedData
                    }
                } else {
                    print("No data")
                }
            } catch {
                print("Error")
            }
        }.resume()
    }
    
    
    //NEW TRAINING
    var didChange = PassthroughSubject<Void, Never>()
    
    static let titles = ["Squat", "Pull up", "Push up", "Climber", "Leg rise"]
    
    public var title: String = "Nope" { didSet { update() } }
    var reps: Double = 0 {didSet { update() } }
    
    func update() {
        didChange.send(())
    }
}
