//
//  Message.swift
//  SchoolConnectApp
//
//  Created by Aditya Maroo on 18/09/2026.
//


import Foundation

struct MessageEntity: Identifiable {

    let id: UUID
    let senderName: String
    let message: String
    let date: String
    let unreadCount: Int
    let avatarColor: MessageAvatarColorEnum

    init(
        id: UUID = UUID(),
        senderName: String,
        message: String,
        date: String,
        unreadCount: Int = 0,
        avatarColor: MessageAvatarColorEnum
    ) {
        self.id = id
        self.senderName = senderName
        self.message = message
        self.date = date
        self.unreadCount = unreadCount
        self.avatarColor = avatarColor
    }
}


enum MessageAvatarColorEnum {
    case purple
    case green
    case orange
    case yellow
}


extension MessageEntity {

    static let mockData: [MessageEntity] = [

        MessageEntity(
            senderName: "Mrs. Priya Kapoor",
            message: "The worksheet needs to be submitted ...",
            date: "2h ago",
            unreadCount: 2,
            avatarColor: .purple
        ),

        MessageEntity(
            senderName: "Mr. Rajesh Kumar",
            message: "Thank you for the update. I'll note t...",
            date: "Yesterday",
            avatarColor: .green
        ),

        MessageEntity(
            senderName: "Ms. Deepa Nair",
            message: "Aarav is doing well in English this term!",
            date: "Sep 3",
            avatarColor: .orange
        ),

        MessageEntity(
            senderName: "Mrs. Sunita Verma",
            message: "Please remind Aarav to bring his Hindi n...",
            date: "Sep 1",
            avatarColor: .yellow
        )
    ]
}
