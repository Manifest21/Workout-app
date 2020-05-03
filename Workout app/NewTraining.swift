//
//  NewTraining.swift
//  Workout app
//
//  Created by Łukasz Uranowski on 03/05/2020.
//  Copyright © 2020 Łukasz Uranowski. All rights reserved.
//

import SwiftUI

struct NewTraining: View {
    
    @State private var title: String = ""
    @State private var date: String = ""
    @State private var reps: String = ""
    
    var body: some View {
        NavigationView {
            VStack (spacing: 30){
                TextField(" Exercise name", text: $title)
                    .frame(width: 220, height: 40)
                    .background(LinearGradient(gradient: Gradient(colors: [Color("LightGrey"), Color("DarkGrey")]), startPoint: .top, endPoint: .bottom).opacity(0.3))
                    .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.gray.opacity(0.3), lineWidth: 1))
                    .padding(.top, 50)
                TextField(" Date: dd-mm-yyyy", text: $date)
                    .frame(width: 220, height: 40)
                    .background(LinearGradient(gradient: Gradient(colors: [Color("LightGrey"), Color("DarkGrey")]), startPoint: .top, endPoint: .bottom).opacity(0.3))
                    .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.gray.opacity(0.3), lineWidth: 1))
                TextField(" Reps count", text: $reps)
                    .frame(width: 220, height: 40)
                    .background(LinearGradient(gradient: Gradient(colors: [Color("LightGrey"), Color("DarkGrey")]), startPoint: .top, endPoint: .bottom).opacity(0.3))
                    .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.gray.opacity(0.3), lineWidth: 1))
                Spacer()
            }
        .navigationBarTitle("Add workout")

        }
        .padding(.horizontal)
    }
}

struct NewTraining_Previews: PreviewProvider {
    static var previews: some View {
        NewTraining()
    }
}
