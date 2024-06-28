//
//  EventManager.swift
//  Event Countdown
//
//  Created by Bohdan Tkachenko on 6/25/24.
//

import Foundation
import SwiftUI

class EventManager: ObservableObject {
    
    @Published var events: [Event] = Event.all

    //MARK: - CRUD
    ///Create
    
    func create(_ event: Event) {
        events.append(event)
    }
    
    ///Read

    
    ///Update
    func updateEvent(_ item: Event) {
        if let index = events.firstIndex(where: { $0.id == item.id }) {
            events[index] = item
        }
    }
    
    
    ///Delete
    func delete(event: Event) {
        events.removeAll(where: { $0.id == event.id })
    }
}
