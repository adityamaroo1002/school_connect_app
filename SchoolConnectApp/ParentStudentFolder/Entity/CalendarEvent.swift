//
//  CalendarEvent.swift
//  SchoolConnectApp
//
//  Created by Aditya Maroo on 21/09/2026.
//


import Foundation
import SwiftUI

struct CalendarEvent: Identifiable {

    let id: UUID
    let title: String
    let date: Date
    let time: String?
    let location: String?
    let type: CalendarEventType

    init(
        id: UUID = UUID(),
        title: String,
        date: Date,
        time: String? = nil,
        location: String? = nil,
        type: CalendarEventType
    ) {
        self.id = id
        self.title = title
        self.date = date
        self.time = time
        self.location = location
        self.type = type
    }
}

enum CalendarEventType {

    case attendance
    case homework
    case holiday
    case event

    var color: Color {

        switch self {
        case .attendance:
            return .green

        case .homework:
            return .orange

        case .holiday:
            return .red

        case .event:
            return .purple
        }
    }
}


struct AttendanceAlert: Identifiable {

    let id: UUID
    let title: String
    let subtitle: String
    let type: AttendanceAlertType

    init(
        id: UUID = UUID(),
        title: String,
        subtitle: String,
        type: AttendanceAlertType
    ) {
        self.id = id
        self.title = title
        self.subtitle = subtitle
        self.type = type
    }
}

enum AttendanceAlertType {
    case absent
    case late
    case present
}

struct CalendarDay: Identifiable {

    let id: UUID
    let date: Date
    let isCurrentMonth: Bool
    let isToday: Bool

    let attendance: Bool
    let homework: Bool
    let holiday: Bool
    let event: Bool

    init(
        id: UUID = UUID(),
        date: Date,
        isCurrentMonth: Bool,
        isToday: Bool,
        attendance: Bool = false,
        homework: Bool = false,
        holiday: Bool = false,
        event: Bool = false
    ) {
        self.id = id
        self.date = date
        self.isCurrentMonth = isCurrentMonth
        self.isToday = isToday
        self.attendance = attendance
        self.homework = homework
        self.holiday = holiday
        self.event = event
    }
}
