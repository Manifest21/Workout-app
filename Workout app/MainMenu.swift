//
//  MainMenu.swift
//  Workout app
//
//  Created by Łukasz Uranowski on 03/05/2020.
//  Copyright © 2020 Łukasz Uranowski. All rights reserved.
//

import SwiftUI

struct MainMenu: View {
    
    var body: some View {
        NavigationView  {
            VStack(spacing: 25.0) {
                HStack {
                    NavigationLink(destination: MenuTrain()) {
                        Image(systemName: "book")
                            .font(.system(size: 60))
                            .frame(width: 125, height: 125)
                    }
                    .frame(minWidth: 0, maxWidth: 150, minHeight: 0, maxHeight: 150)
                    .foregroundColor(.white)
                    .background(LinearGradient(gradient: Gradient(colors: [Color("DarkGreen"), Color("LightGreen")]), startPoint: .topLeading, endPoint: .bottomTrailing))
                    .cornerRadius(40)
                    Spacer()
                    NavigationLink(destination: NewTraining()) {
                        Image(systemName: "text.badge.plus")
                            .font(.system(size: 60))
                            .frame(width: 125, height: 125)
                    }
                    .frame(minWidth: 0, maxWidth: 150, minHeight: 0, maxHeight: 150)
                    .foregroundColor(.white)
                    .background(LinearGradient(gradient: Gradient(colors: [Color("DarkYellow"), Color("LightYellow")]), startPoint: .topTrailing, endPoint: .bottomLeading))
                    .cornerRadius(40)
                    }
                .padding(.horizontal, 25)
                HStack {
                    NavigationLink(destination: CalendarPage()) {
                        Image(systemName: "calendar")
                            .font(.system(size: 60))
                            .frame(width: 125, height: 125)
                    }
                    .frame(minWidth: 0, maxWidth: 150, minHeight: 0, maxHeight: 150)
                    .foregroundColor(.white)
                    .background(LinearGradient(gradient: Gradient(colors: [Color("DarkBlue"), Color("LightBlue")]), startPoint: .bottomLeading, endPoint: .topTrailing))
                    .cornerRadius(40)
                    Spacer()
                    NavigationLink(destination: Statistics()) {
                        Image(systemName: "person.crop.square")
                            .font(.system(size: 60))
                            .frame(width: 125, height: 125)
                    }
                    .frame(minWidth: 0, maxWidth: 150, minHeight: 0, maxHeight: 150)
                    .foregroundColor(.white)
                    .background(LinearGradient(gradient: Gradient(colors: [Color("DarkRed"), Color("LightRed")]), startPoint: .bottomTrailing, endPoint: .topLeading))
                    .cornerRadius(40)
                    }
                .padding(.horizontal, 25)
                
            }
            .padding(.bottom, -50)
        }
    }
}

struct MainMenu_Previews: PreviewProvider {
    static var previews: some View {
        MainMenu()
    }
}
