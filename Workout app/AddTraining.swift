//
//  AddTraining.swift
//  Workout app
//
//  Created by Łukasz Uranowski on 03/05/2020.
//  Copyright © 2020 Łukasz Uranowski. All rights reserved.
//

import SwiftUI

struct AddTraining: View {
    var body: some View {
        Image(systemName: "text.badge.plus")
            .font(.system(size: 100))
            .foregroundColor(.yellow)
    }
}

struct AddTraining_Previews: PreviewProvider {
    static var previews: some View {
        AddTraining()
    }
}
