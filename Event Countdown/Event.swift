//
//  Event.swift
//  Event Countdown
//
//  Created by Bohdan Tkachenko on 6/24/24.
//

import Foundation
import SwiftUI

struct Event: Comparable, Identifiable, Hashable {
    var id: UUID
    var title: String
    var date: Date
    var textColor: Color
}
