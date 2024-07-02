//
//  EventRow.swift
//  Event Countdown
//
//  Created by Bohdan Tkachenko on 6/24/24.
//

import SwiftUI

struct EventRow: View {
    
    let event: Event
    
    @State private var timeRemaining: String = ""
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Text(event.title)
                .font(.title3)
                .fontWeight(.bold)
                .foregroundStyle(event.textColor)
            Text("\(timeRemaining)")
                .font(.subheadline)
                .fontWeight(.medium)
                .onReceive(timer) { time in
                    timeRemaining = dateDescription(date: event.date, relativeTo: Date.now)
                }
        }
        
    }
    
    private func dateDescription(date: Date, relativeTo anotherDate: Date) -> String {
        let formatter = RelativeDateTimeFormatter()
        formatter.dateTimeStyle = .named
        formatter.unitsStyle = .full
        
        return formatter.localizedString(for: date, relativeTo: anotherDate)
    }
}

#Preview {
    EventRow(event: Event.finishCourse)
}
