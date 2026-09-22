//
//  Profile.swift
//  SchoolConnectApp
//
//  Created by Aditya Maroo on 18/09/2026.
//


import Foundation
import SwiftUI

struct ProfileEntity {

    let name: String
    let email: String
    let initials: String
    let linkedChildren: [LinkedChildEntity]
}

struct LinkedChildEntity: Identifiable {

    let id: UUID
    let name: String
    let grade: String
    let section: String
    let rollNumber: String
    let initial: String

    init(
        id: UUID = UUID(),
        name: String,
        grade: String,
        section: String,
        rollNumber: String
    ) {
        self.id = id
        self.name = name
        self.grade = grade
        self.section = section
        self.rollNumber = rollNumber

        self.initial = String(
            name.first ?? "A"
        )
    }
}

struct SettingItemEntity: Identifiable {

    let id = UUID()
    let title: String
    let icon: String
    let iconBackground: Color
    let type: SettingType
}

enum SettingType {

    case notification
    case password
    case language
    case biometric
    case help
    case privacy
    case terms
}


extension ProfileEntity {

    static let mock = ProfileEntity(

        name: "Rahul Sharma",

        email: "rahul.sharma@email.com",

        initials: "RS",

        linkedChildren: [

            LinkedChildEntity(
                name: "Aarav Sharma",
                grade: "Grade 5",
                section: "Section A",
                rollNumber: "12"
            ),

            LinkedChildEntity(
                name: "Ananya Sharma",
                grade: "Grade 3",
                section: "Section B",
                rollNumber: "08"
            )
        ]
    )
}
