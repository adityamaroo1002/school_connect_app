//
//  MessagesView.swift
//  SchoolConnectApp
//
//  Created by Aditya Maroo on 18/09/2026.
//


import SwiftUI

struct MessagesView: View {

    let messages: [MessageEntity]

    var body: some View {

        ScrollView(
            showsIndicators: false
        ) {

            LazyVStack(spacing: 0) {

                ForEach(messages) { message in

                    MessageCardView(
                        message: message
                    )
                }
            }
        }
        .background(
            Color(.systemGroupedBackground)
        )
    }
}

#Preview {
    MessagesView(messages: MessageEntity.mockData)
}
