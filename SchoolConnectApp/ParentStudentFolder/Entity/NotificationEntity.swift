//
//  NotificationEntity.swift
//  SchoolConnectApp
//
//  Created by Aditya Maroo on 15/09/2026.
//


import Foundation

enum NotificationType: String {
    
    case announcement
    case approval
    case message
    case reminder
}

struct NotificationEntity: Identifiable {
    
    let id: Int
    let type: NotificationType
    let title: String
    let date: Date
    let isUnread: Bool
}

extension NotificationEntity {
    
    static func mockData() -> [NotificationEntity] {
        
        [
            NotificationEntity(
                id: 1,
                type: .announcement,
                title: "School notice: Annual Day Celebration — Oct 15",
                date: Date().addingTimeInterval(-3600),
                isUnread: true
            ),
            
            NotificationEntity(
                id: 2,
                type: .approval,
                title: "Leave request for Sep 3 has been Approved",
                date: Date().addingTimeInterval(-86_400),
                isUnread: false
            ),
            
            NotificationEntity(
                id: 3,
                type: .message,
                title: "Mrs. Priya Kapoor replied to your message",
                date: Date().addingTimeInterval(-172_800),
                isUnread: false
            ),
            
            NotificationEntity(
                id: 4,
                type: .reminder,
                title: "Reminder: Science — Solar System Diagram due Sep 12",
                date: Date().addingTimeInterval(-259_200),
                isUnread: false
            )
        ]
    }
}


