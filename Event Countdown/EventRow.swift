//
//  EventRow.swift
//  Event Countdown
//
//  Created by Bohdan Tkachenko on 6/24/24.
//

import SwiftUI

struct EventRow: View {
    
    let event: Event
    
    @State private var timeRemaining: TimeInterval
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    init(event: Event) {
        self.event = event
        _timeRemaining = State(initialValue: event.date.timeIntervalSinceNow)
    }
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Text(event.title)
                .font(.title3)
                .fontWeight(.bold)
                .foregroundStyle(event.textColor)
            Text("\(Date(timeIntervalSinceNow: timeRemaining).formattedDate())")
                .font(.subheadline)
                .fontWeight(.medium)
                .onReceive(timer) { time in
                    if timeRemaining > 0 {
                        timeRemaining -= 1
                    }
                }
        }
        
    }
}

#Preview {
    EventRow(event: Event.finishCourse)
}
