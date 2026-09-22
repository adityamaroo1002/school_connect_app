//
//  MessageCardView.swift
//  SchoolConnectApp
//
//  Created by Aditya Maroo on 18/09/2026.
//
import SwiftUI

 struct MessageCardView: View {

     let message: MessageEntity

    var body: some View {

        VStack(spacing: 0) {

            HStack(
                alignment: .center,
                spacing: 10
            ) {

                MessageAvatarView(
                    name: message.senderName,
                    color: message.avatarColor
                )

                MessageContentView(
                    message: message
                )

                MessageMetaView(
                    date: message.date,
                    unreadCount: message.unreadCount
                )
            }
            .padding(.horizontal, 12)
            .frame(height: 68)

            Divider()
                .padding(.leading, 56)
        }
        .background(
            Color(.systemGroupedBackground)
        )
    }
}


private struct MessageAvatarView: View {

    let name: String
    let color: MessageAvatarColorEnum

    var body: some View {

        Text(initials)
            .font(
                .system(
                    size: 12,
                    weight: .bold
                )
            )
            .foregroundColor(.white)
            .frame(
                width: 36,
                height: 36
            )
            .background(
                Circle()
                    .fill(color.color)
            )
    }

    private var initials: String {

        let components = name
            .split(separator: " ")
            .filter {
                !$0.hasSuffix(".")
            }

        return components
            .prefix(2)
            .compactMap { $0.first }
            .map(String.init)
            .joined()
    }
}


private struct MessageContentView: View {

    let message: MessageEntity

    var body: some View {

        VStack(
            alignment: .leading,
            spacing: 4
        ) {

            Text(message.senderName)
                .font(
                    .system(
                        size: 11,
                        weight: .bold
                    )
                )
                .foregroundColor(.primary)
                .lineLimit(1)

            Text(message.message)
                .font(.system(size: 9))
                .foregroundColor(.secondary)
                .lineLimit(1)
        }
        .frame(
            maxWidth: .infinity,
            alignment: .leading
        )
    }
}

private struct MessageMetaView: View {

    let date: String
    let unreadCount: Int

    var body: some View {

        VStack(
            alignment: .trailing,
            spacing: 7
        ) {

            Text(date)
                .font(.system(size: 8))
                .foregroundColor(.secondary)

            if unreadCount > 0 {

                Text("\(unreadCount)")
                    .font(
                        .system(
                            size: 8,
                            weight: .bold
                        )
                    )
                    .foregroundColor(.white)
                    .frame(
                        width: 17,
                        height: 17
                    )
                    .background(
                        Circle()
                            .fill(Color.blue)
                    )
            }
        }
        .frame(
            width: 42,
            alignment: .trailing
        )
    }
}



extension MessageAvatarColorEnum {

    var color: Color {
        switch self {
        case .purple:
            return .purple

        case .green:
            return .green

        case .orange:
            return .orange

        case .yellow:
            return .yellow
        }
    }
}
