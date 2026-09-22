//
//  ChatMessage.swift
//  SchoolConnectApp
//
//  Created by Aditya Maroo on 18/09/2026.
//


import Foundation

struct ChatMessageEntity: Identifiable {

    let id: UUID
    let text: String
    let time: String
    let sender: MessageSenderEnum

    init(
        id: UUID = UUID(),
        text: String,
        time: String,
        sender: MessageSenderEnum
    ) {
        self.id = id
        self.text = text
        self.time = time
        self.sender = sender
    }
}

enum MessageSenderEnum {
    case me
    case teacher
}

struct OfficeHoursNotice {

    let message: String
}

//MARK: - Mock Data
extension ChatMessageEntity {

    static let mockData: [ChatMessageEntity] = [

        ChatMessageEntity(
            text:
                "Hello! I wanted to check on Aarav's " +
                "progress with the fractions chapter.",
            time: "3:15 PM",
            sender: .teacher
        ),

        ChatMessageEntity(
            text:
                "Hi Mrs. Kapoor! He's been practicing. " +
                "Could you share some extra practice problems?",
            time: "3:22 PM",
            sender: .me
        ),

        ChatMessageEntity(
            text:
                "Of course! I'll upload a supplementary " +
                "worksheet. The worksheet needs to be " +
                "submitted by tomorrow along with the " +
                "original assignment.",
            time: "3:30 PM",
            sender: .teacher
        ),

        ChatMessageEntity(
            text:
                "Thank you so much! We'll make sure it's completed.",
            time: "3:35 PM",
            sender: .me
        )
    ]
}
