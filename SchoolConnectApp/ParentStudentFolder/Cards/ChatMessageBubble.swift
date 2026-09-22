//
//  ChatMessageBubble.swift
//  SchoolConnectApp
//
//  Created by Aditya Maroo on 18/09/2026.
//


import SwiftUI

 struct ChatMessageBubble: View {

     let message: ChatMessageEntity

    private var isMine: Bool {
        message.sender == .me
    }

    var body: some View {

        HStack {

            if isMine {
                Spacer(minLength: 45)
            }

            VStack(
                alignment: isMine
                    ? .trailing
                    : .leading,
                spacing: 4
            ) {

                Text(message.text)
                    .font(.system(size: 13))
                    .foregroundColor(
                        isMine
                        ? .white
                        : .primary
                    )
                    .multilineTextAlignment(
                        isMine
                        ? .trailing
                        : .leading
                    )
                    .fixedSize(
                        horizontal: false,
                        vertical: true
                    )

                HStack(
                    spacing: 3
                ) {

                    Text(message.time)
                        .font(.system(size: 8))
                        .foregroundColor(
                            isMine
                            ? .white.opacity(0.75)
                            : .secondary
                        )

                    if isMine {

                        Image(
                            systemName: "checkmark"
                        )
                        .font(.system(size: 7, weight: .bold))
                        .foregroundColor(
                            .white.opacity(0.8)
                        )
                    }
                }
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 9)
            .background(
                isMine
                ? Color.blue
                : Color.white
            )
            .clipShape(
                RoundedRectangle(
                    cornerRadius: 15,
                    style: .continuous
                )
            )

            if !isMine {
                Spacer(minLength: 45)
            }
        }
    }
}
