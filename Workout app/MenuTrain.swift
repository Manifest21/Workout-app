//
//  MenuTrain.swift
//  Workout app
//
//  Created by Łukasz Uranowski on 02/05/2020.
//  Copyright © 2020 Łukasz Uranowski. All rights reserved.
//


import SwiftUI

struct TrainingSection: Codable, Identifiable {
    var id: UUID
    var name: String
    var items: [TrainingItem]
}

struct TrainingItem: Codable, Equatable, Identifiable {
    var id: UUID
    var name: String
    var reps: Int
    var parts: [String]
}



class FetchTrainings: ObservableObject {
    @Published var trainings = [TrainingSection]()
    
    init() {
        let url = URL(string: "https://raw.githubusercontent.com/Manifest21/Workout-app/master/Workout%20app/trainingsData.json")!
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            do {
                if let trainingsData = data {
                    let decodedData = try JSONDecoder().decode([TrainingSection].self, from: trainingsData)
                    DispatchQueue.main.async {
                        self.trainings = decodedData
                        
                    }
                } else {
                    print("No data")
                    
                }
            } catch {
                print("Error")
                
            }
        }.resume()
    }
}

struct MenuTrain: View {
    @ObservedObject var fetch = FetchTrainings()
    
    var body: some View {
        VStack {
            List(fetch.trainings) { trainings in
                VStack(alignment: .leading) {
                    Text(trainings.name)
                }
                
            }
        }
    }
}

