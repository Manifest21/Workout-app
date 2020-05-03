//
//  TrainingHistory.swift
//  Workout app
//
//  Created by Łukasz Uranowski on 03/05/2020.
//  Copyright © 2020 Łukasz Uranowski. All rights reserved.
//

import SwiftUI

struct Occurrence: Identifiable {
    let id = UUID()
    let start: Date
    let title: String
}

struct Day: Identifiable {
    let id = UUID()
    let title: String
    let occurrences: [Occurrence]
    let date: Date
}

struct EventData {
    let sections: [Day]
    
    init() {
        let first = Occurrence(start: EventData.constructDate(day: 5, month: 5, year: 2020), title: "First Event")
        let second = Occurrence(start: EventData.constructDate(day: 4, month: 6, year: 2020, hour: 10), title: "Second Event")
        let third = Occurrence(start: EventData.constructDate(day: 5, month: 5, year: 2020), title: "Third Event")
    
        let events = [third, first, second].sorted { $0.start < $1.start }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        
        let grouped = Dictionary(grouping: events) { (occurrence: Occurrence) -> String in
            dateFormatter.string(from: occurrence.start)
        }
        
        self.sections = grouped.map { day -> Day in
            Day(title: day.key, occurrences: day.value, date: day.value[0].start)
        }.sorted { $0.date < $1.date }
    }
    
    static func constructDate(day: Int, month: Int, year: Int, hour: Int = 0, minute: Int = 0) -> Date {
        var dateComponents = DateComponents()
        dateComponents.year = year
        dateComponents.month = month
        dateComponents.day = day
        dateComponents.hour = hour
        dateComponents.minute = minute
        
        let userCalendar = Calendar.current
        let someDateTime = userCalendar.date(from: dateComponents)
        return someDateTime!
    }
}




struct TrainingHistory: View {
    
    let events = EventData()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(events.sections) { section in
                    Section(header: Text(section.title)) {
                        ForEach(section.occurrences) { occurrence in
                            NavigationLink(destination: OccurrenceDetail(occurrence: occurrence)) {
                                OccurrenceRow(occurrence: occurrence)
                            }
                        }
                    }
                }
            }.navigationBarTitle(Text("Events"))
        }
    }
}

struct OccurrenceDetail: View {
    let occurrence: Occurrence
    
    var body: some View {
        Text(occurrence.title)
    }
}

struct OccurrenceRow: View {
    let occurrence: Occurrence
    var body: some View {
        Text(occurrence.title)
    }
}


struct TrainingHistory_Previews: PreviewProvider {
    static var previews: some View {
        TrainingHistory()
    }
}
