//
//  AssignmentDetail.swift
//  SchoolConnectApp
//
//  Created by Aditya Maroo on 18/09/2026.
//


import Foundation

struct AssignmentDetailEntity {

    let id: UUID
    let subject: Subject
    let title: String

    let teacherName: String
    let postedDate: Date

    let instructions: String

    let attachment: AssignmentAttachmentEntity?

    let teacherRole: String
    let grade: String

    var isCompleted: Bool
}

//MARK: - ------------------------------------------------
//MARK: - Attachment Entity
struct AssignmentAttachmentEntity {

    let fileName: String
    let fileSize: String
    let fileType: AttachmentFileTypeEnum
}

enum AttachmentFileTypeEnum {
    case pdf
    case image
    case document
}


extension AssignmentDetailEntity {

    static let mock = AssignmentDetailEntity(

        id: UUID(),

        subject: .math,

        title: "Fractions Worksheet",

        teacherName: "Mrs. Priya Kapoor",

        postedDate: Date(),

        instructions:
            """
            Complete exercises 1–15 from Chapter 4: Fractions. Show all working steps clearly. Use the provided worksheet template. Submit the completed worksheet in class tomorrow.
            """,

        attachment: AssignmentAttachmentEntity(
            fileName: "Fractions_Worksheet.pdf",
            fileSize: "2.4 MB",
            fileType: .pdf
        ),

        teacherRole: "Math",

        grade: "Grade 5-A",

        isCompleted: false
    )
}
