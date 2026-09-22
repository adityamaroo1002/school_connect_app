
//
//  Notice.swift
//  SchoolConnectApp
//
//  Created by Aditya Maroo on 18/09/2026.
//

import Foundation

struct NoticeEntity: Identifiable {
    
    let id: UUID
    let title: String
    let message: String
    let postedDate: Date
    
    let tags: [NoticeTagEnum]
    
    let attachmentCount: Int
    let isRead: Bool
    
    init(
        id: UUID = UUID(),
        title: String,
        message: String,
        postedDate: Date,
        tags: [NoticeTagEnum] = [],
        attachmentCount: Int = 0,
        isRead: Bool = false
    ) {
        self.id = id
        self.title = title
        self.message = message
        self.postedDate = postedDate
        self.tags = tags
        self.attachmentCount = attachmentCount
        self.isRead = isRead
    }
}

extension NoticeEntity {
    
    static let mockData: [NoticeEntity] = [
        
        NoticeEntity(
            title:
                "Annual Day Celebration — October 15",
            
            message:
                """
                All parents are cordially invited to our Annual Day celebration at the School Auditorium. Cultural performances by students, prize distribution, and more. RSVP by October 10 through the app.
                """,
            
            postedDate: Date(),
            
            tags: [
                .highPriority,
                .school
            ],
            
            attachmentCount: 1,
            
            isRead: true
        ),
        
        NoticeEntity(
            title:
                "Updated Class Schedule — Grade 5A",
            
            message:
                """
                Please note the revised timetable effective from September 8. Science period has been moved to the morning slot. Updated schedule is attached.
                """,
            
            postedDate: Date(),
            
            tags: [
                .classTag
            ],
            
            attachmentCount: 1,
            
            isRead: true
        ),
        
        NoticeEntity(
            title:
                "Holiday Notice — Teacher's Day",
            
            message:
                """
                School will remain closed on September 5 on account of Teacher's Day. Regular classes resume September 8.
                """,
            
            postedDate: Date(),
            
            tags: [
                .school
            ],
            
            isRead: true
        ),
        
        NoticeEntity(
            title:
                "Fee Payment Reminder — Q2",
            
            message:
                """
                Second quarter fees are due by September 15. Please ensure timely payment through the school portal. Late fee of ₹500 applies after the due date.
                """,
            
            postedDate: Date(),
            
            tags: [
                .school
            ],
            
            isRead: true
        )
    ]
}

enum NoticeTagEnum {
    
    case highPriority
    case school
    case classTag
    
    var title: String {
        switch self {
                
            case .highPriority:
                return "HIGH PRIORITY"
                
            case .school:
                return "SCHOOL"
                
            case .classTag:
                return "CLASS"
        }
    }
    
}
