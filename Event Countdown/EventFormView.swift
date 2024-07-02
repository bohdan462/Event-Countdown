//
//  EvenFormView.swift
//  Event Countdown
//
//  Created by Bohdan Tkachenko on 6/24/24.
//

import SwiftUI

enum FormType {
    case add
    case edit(Event)
}

struct EventFormView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @State var formtype: FormType
    @State var title: String
    @State var date: Date
    @State var color: Color
    
    var onSave: (Event) -> Void
    
    var body: some View {
        
        
        Form {
            Section {
                
                switch formtype {
                case .add:
                    TextField("", text: $title)
                case .edit(let event):
                    TextField("\(event.title)", text: $title)
                }
                
                HStack {
                    
                    Text("Date")
                    
                    DatePicker(selection: $date,
                               in: Date.now..., displayedComponents: .date) {}
                    
                    DatePicker(selection: $date,
                               displayedComponents: .hourAndMinute) {}
                    
                } ///HStack
                
                ColorPicker("Color", selection: $color)
                
            } ///Section
        }///Form
        .toolbar {
            
            switch formtype {
            case .add:
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Create") {
                        self.onSave(Event(id: UUID(),
                                          title: title,
                                          date: date,
                                          textColor: color))
                        dismiss()
                    }
                    .tint(.green)
                    .disabled(title.isEmpty ? true : false)
                    
                }
            case .edit(let event):
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Save") {
                        let event  = Event(id: event.id,
                                           title: title,
                                           date: date,
                                           textColor: color)
                        self.onSave(event)
                        dismiss()
                    }
                }
            }
            
        }
        
        
    }
}

#Preview {
    NavigationStack {
        EventFormView(formtype: .add, title: " ", date: Date.now.addingTimeInterval(-1000), color: .blue, onSave: { _ in Event.birthday })
    }
}
