//
//  Statistics.swift
//  Workout app
//
//  Created by Łukasz Uranowski on 03/05/2020.
//  Copyright © 2020 Łukasz Uranowski. All rights reserved.
//

import SwiftUI

struct Statistics: View {
    var body: some View {
        VStack {
            
            Image(systemName: "person.crop.square")
                .font(.system(size: 100))
                .foregroundColor(Color("DarkRed"))
                .padding(.bottom, 20)
            Text("STATISTICS PAGE")
        }
    }
}

struct Statistics_Previews: PreviewProvider {
    static var previews: some View {
        Statistics()
    }
}
