//
//  CalendarPage.swift
//  Workout app
//
//  Created by Łukasz Uranowski on 03/05/2020.
//  Copyright © 2020 Łukasz Uranowski. All rights reserved.
//

import SwiftUI

struct CalendarPage: View {
    var body: some View {
        VStack {
            Image(systemName: "calendar")
                .font(.system(size: 100))
                .foregroundColor(.blue)
                .padding(.bottom, 20)
            Text("CALENDAR PAGE")
        }
    }
}

struct CalendarPage_Previews: PreviewProvider {
    static var previews: some View {
        CalendarPage()
    }
}
