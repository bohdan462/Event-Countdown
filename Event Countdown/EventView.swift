//
//  EventView.swift
//  Event Countdown
//
//  Created by Bohdan Tkachenko on 6/24/24.
//

import SwiftUI


struct EventView: View {
    
    @StateObject var manager = EventManager()
    
    var body: some View {
        NavigationStack {
            List(manager.events.sorted(by: < ), id: \.id) { event in
                NavigationLink(value: event) {
                    EventRow(event: event)
                        .swipeActions {
                            Button("Delete") {
                                self.manager.delete(event: event)
                            }
                            .tint(.red)
                        } ///SwipeAction
                } ///NavigationLink
            } ///List
            .listStyle(PlainListStyle())
            .navigationDestination(for: Event.self, destination: { event in
                EventFormView(formtype: .edit(event),
                              title: event.title,
                              date: event.date,
                              color: event.textColor,
                              onSave: { event in manager.updateEvent(event)})
                .navigationTitle("Edit: \(event.title)")
                .navigationBarTitleDisplayMode(.inline)
            })
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink(destination: EventFormView(formtype: .add,
                                                              title: "", date: Date.now,
                                                              color: .black,
                                                              onSave: { event in manager.create(event)})
                        .navigationTitle("Add Event")
                        .navigationBarTitleDisplayMode(.inline)) {
                        Image(systemName: "plus")
                    }
                }
                
            }///ToolBar
            .navigationTitle("Events")
        } ///Nav Stack
        
    }
}

#Preview {
    EventView()
}
