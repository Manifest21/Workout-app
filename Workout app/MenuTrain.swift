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

struct TrainingSection: Codable, Identifiable {
    var id: UUID
    var title: String
    var items: [TrainingItem]
}

struct TrainingItem: Codable, Equatable, Identifiable {
    var id: UUID
    var name: String
    var reps: Int
    var parts: [String]
}


struct Todo: Codable, Identifiable {
    public var id: Int
    public var title: String
    public var completed: Bool
}

class FetchToDo: ObservableObject {
    @Published var todos = [TrainingSection]()
     
    init() {
        let url = URL(string: "https://github.com/Manifest21/Workout-app/blob/master/Workout%20app/menu.json")!
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            do {
                if let todoData = data {
                    let decodedData = try JSONDecoder().decode([TrainingSection].self, from: todoData)
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
}

struct MenuTrain: View {
    @ObservedObject var fetch = FetchToDo()
    var body: some View {
        VStack {
            List(fetch.todos) { todo in
                VStack(alignment: .leading) {
                    Text(todo.title)
                        .font(.system(size: 11))
                        .foregroundColor(Color.gray)
                }
            }
        }
    }
}

