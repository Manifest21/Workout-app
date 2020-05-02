//
//  MenuTrain.swift
//  Workout app
//
//  Created by Łukasz Uranowski on 02/05/2020.
//  Copyright © 2020 Łukasz Uranowski. All rights reserved.
//


import SwiftUI

struct TrainingSession: Codable, Identifiable {
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
