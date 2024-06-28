//
//  Extension.swift
//  Event Countdown
//
//  Created by Bohdan Tkachenko on 6/25/24.
//

import Foundation

extension Event {
    static func < (lhs: Event, rhs: Event) -> Bool {
        return lhs.date < rhs.date
    }

}

extension Event {
    static let all: [Event] = [.finishCourse, .birthday, .buyMilk]
    
}

extension Event {
    static let finishCourse = Event(id: UUID(),
                                    title: "Till i finish course",
                                    date: Date.now.addingTimeInterval(+40),
                                    textColor: .green)
    static let birthday = Event(id: UUID(),
                                title: "My 21st birthday",
                                date: Date.now.addingTimeInterval(+120),
                                textColor: .red)
    
    static let buyMilk = Event(id: UUID(),
                               title: "By milk",
                               date: Date.now.addingTimeInterval(+200),
                               textColor: .red)
    
}

extension Date {
    
    func formattedDate() -> String {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .full
        return formatter.localizedString(for: self, relativeTo: Date.now)
    }
    
}
