//
//  Assignment.swift
//  SchoolConnectApp
//
//  Created by Aditya Maroo on 17/09/2026.
//


import Foundation

struct AssignmentEntity: Identifiable {
    
    let id: UUID
    let subject: Subject
    let title: String
    let description: String
    let teacherName: String
    let dueDate: Date
    let status: AssignmentStatus
    let attachmentCount: Int
    let isCompleted: Bool
    
    init(
        id: UUID = UUID(),
        subject: Subject,
        title: String,
        description: String,
        teacherName: String,
        dueDate: Date,
        status: AssignmentStatus,
        attachmentCount: Int = 0,
        isCompleted: Bool = false
    ) {
        self.id = id
        self.subject = subject
        self.title = title
        self.description = description
        self.teacherName = teacherName
        self.dueDate = dueDate
        self.status = status
        self.attachmentCount = attachmentCount
        self.isCompleted = isCompleted
    }
}

enum Subject {
    case math
    case english
    case science
    case hindi
    
    var title: String {
        switch self {
            case .math:
                return "MATH"
            case .english:
                return "ENGLISH"
            case .science:
                return "SCIENCE"
            case .hindi:
                return "HINDI"
        }
    }
}

enum AssignmentStatus {
    case overdue
    case dueTomorrow
    case upcoming
    case completed
    
    var title: String {
        switch self {
            case .overdue:
                return "OVERDUE"
            case .dueTomorrow:
                return "DUE TOMORROW"
            case .upcoming:
                return "UPCOMING"
            case .completed:
                return "COMPLETED"
        }
    }
}

enum AssignmentFilter: CaseIterable {
    
    case all
    case dueToday
    case upcoming
    case overdue
    case completed
    
    var title: String {
        switch self {
            case .all:
                return "All"
            case .dueToday:
                return "Due Today"
            case .upcoming:
                return "Upcoming"
            case .overdue:
                return "Overdue"
            case .completed:
                return "Completed"
        }
    }
}


extension AssignmentEntity {
    
    static let mockData: [AssignmentEntity] = [
        
        AssignmentEntity(
            subject: .math,
            title: "Fractions Worksheet",
            description:
                "Complete exercises 1–15 from Chapter 4. Show all working.",
            teacherName: "Mrs. Priya Kapoor",
            dueDate: Date(),
            status: .overdue,
            attachmentCount: 1
        ),
        
        AssignmentEntity(
            subject: .english,
            title: "Essay: My Favorite Book",
            description:
                "Write a 300-word essay about your favorite book and why you enjoy it.",
            teacherName: "Ms. Deepa Nair",
            dueDate: Date(),
            status: .dueTomorrow
        ),
        
        AssignmentEntity(
            subject: .science,
            title: "Solar System Diagram",
            description:
                "Draw and label all 8 planets with key facts. Use A3 paper.",
            teacherName: "Mr. Rajesh Kumar",
            dueDate: Date(),
            status: .upcoming,
            isCompleted: true
        ),
        
        AssignmentEntity(
            subject: .hindi,
            title: "Poem Recitation Preparation",
            description:
                "Memorize and practice the poem from page 42.",
            teacherName: "Mrs. Sunita Verma",
            dueDate: Date(),
            status: .upcoming
        )
    ]
}
