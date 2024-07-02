//
//  Event.swift
//  Event Countdown
//
//  Created by Bohdan Tkachenko on 6/24/24.
//

import Foundation
import SwiftUI

struct Event: Comparable, Identifiable, Hashable {
    let id: UUID
    let title: String
    let date: Date
    let textColor: Color
}
