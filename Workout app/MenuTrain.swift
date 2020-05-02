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
    public var id: Int
    public var title: String
    public var items: [TrainingItem]
}

struct TrainingItem: Codable, Equatable, Identifiable {
    public var id: Int
    public var name: String
    public var reps: Int
    public var parts: [String]
}


struct Todo: Codable, Identifiable {
    public var id: Int
    public var title: String
}

class FetchToDo: ObservableObject {
    @Published var todos = [Todo]()
     
    init() {
        let url = URL(string: "https://jsonplaceholder.typicode.com/todos")!
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
}

struct MenuTrain: View {
    @ObservedObject var fetch = FetchToDo()
    var body: some View {
        VStack {
            List(fetch.todos) { todo in
                VStack(alignment: .leading) {
                    Text(todo.title)
                        .font(.body)
                        .fontWeight(.light)
                        .foregroundColor(Color.blue)
                }
            }
        }
    }
}

