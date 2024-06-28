//
//  Event_CountdownTests.swift
//  Event CountdownTests
//
//  Created by Bohdan Tkachenko on 6/28/24.
//

import XCTest

final class Event_CountdownTests: XCTestCase {

    func testAddEventToCollection() {
        let manager = EventManager()
        let event = Event(id: UUID(),
                         title: "By Car",
                         date: Date.now.addingTimeInterval(+200),
                         textColor: .red)
        
        manager.events.append(event)
        XCTAssert(manager.events.contains(where: { $0 == event }))
        
    }

}
