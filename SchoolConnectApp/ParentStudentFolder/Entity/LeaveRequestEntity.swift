//
//  LeaveRequestEntity.swift
//  SchoolConnectApp
//
//  Created by Aditya Maroo on 16/09/2026.
//


import Foundation

struct LeaveRequestEntity: Identifiable, Hashable {
    
    let id: UUID
    let title: String
    let description: String
    let submittedDate: String
    let status: LeaveStatus
    let actionMessage: String?
    
    init(
        id: UUID = UUID(),
        title: String,
        description: String,
        submittedDate: String,
        status: LeaveStatus,
        actionMessage: String? = nil
    ) {
        self.id = id
        self.title = title
        self.description = description
        self.submittedDate = submittedDate
        self.status = status
        self.actionMessage = actionMessage
    }
}

enum LeaveStatus: String, CaseIterable {
    case pending
    case approved
    case rejected
    
    var title: String {
        rawValue.uppercased()
    }
}

//MARK: - ------------------------------------------------
//MARK: -  Leave Filter keys
enum LeaveFilter: String, CaseIterable, Identifiable {
    case all = "All"
    case pending = "Pending"
    case approved = "Approved"
    case rejected = "Rejected"

    var id: String { rawValue }
}

//MARK: - ------------------------------------------------
//MARK: -  Mock Data
extension LeaveRequestEntity {
    
    static let mockData: [LeaveRequestEntity] = [
        
        LeaveRequestEntity(
            title: "Sep 9 – Sep 10, 2026",
            description: "Family function out of town.",
            submittedDate: "Submitted: Sep 7, 2026",
            status: .pending
        ),
        
        LeaveRequestEntity(
            title: "Sep 3, 2026",
            description: "Medical appointment.",
            submittedDate: "",
            status: .approved,
            actionMessage: "Approved by: Mrs. Priya Kapoor"
        ),
        
        LeaveRequestEntity(
            title: "Aug 20, 2026",
            description: "Personal reasons.",
            submittedDate: "",
            status: .rejected,
            actionMessage: "Rejected by: Admin · Reason: Insufficient notice"
        )
    ]
}
