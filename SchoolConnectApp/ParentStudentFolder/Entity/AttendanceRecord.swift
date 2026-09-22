//
//  AttendanceRecord.swift
//  SchoolConnectApp
//
//  Created by Aditya Maroo on 16/09/2026.
//


import Foundation

struct AttendanceRecordEntity: Identifiable {

    let id = UUID()
    let date: String
    let status: AttendanceStatus
}

enum AttendanceStatus {
    case present
    case absent
    case late

    var title: String {
        switch self {
        case .present:
            return "PRESENT"
        case .absent:
            return "ABSENT"
        case .late:
            return "LATE"
        }
    }
}



