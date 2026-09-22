//
//  MessageDetailView.swift
//  SchoolConnectApp
//
//  Created by Aditya Maroo on 18/09/2026.
//


import SwiftUI

struct MessageDetailView: View {
    
    let messages: [ChatMessageEntity]
    
    @State private var messageText = ""
    
    var body: some View {
        setup
    }
}

//MARK: - ------------------------------------------------
//MARK: - View Component Extension
private extension MessageDetailView{
    
    var setup: some View{
        VStack(spacing: 0) {
            
            // Keep your existing header here
            // MessageHeaderView()
            
            ScrollViewReader { proxy in
                
                ScrollView(
                    showsIndicators: false
                ) {
                    
                    VStack(spacing: 12) {
                        
                        OfficeHoursNoticeView(
                            notice: OfficeHoursNotice(
                                message:
                                    "Office hours: 3:00 PM – 5:00 PM. " +
                                "Teacher may not respond immediately."
                            )
                        )
                        
                        LazyVStack(spacing: 8) {
                            
                            ForEach(messages) { message in
                                
                                ChatMessageBubble(
                                    message: message
                                )
                                .id(message.id)
                            }
                        }
                        
                        AutoReplyNoticeView()
                    }
                    .padding(.horizontal, 12)
                    .padding(.vertical, 12)
                }
                .onAppear {
                    scrollToLastMessage(
                        proxy: proxy
                    )
                }
            }
            
            MessageInputView(
                text: $messageText,
                onAttachment: {
                    // Open attachment picker
                },
                onSend: {
                    sendMessage()
                }
            )
        }
        .background(
            Color(.systemGroupedBackground)
        )
    }
    
}

//MARK: - ------------------------------------------------
//MARK: - MessageDetail View
private extension MessageDetailView{
     func sendMessage() {
        
        guard !messageText
            .trimmingCharacters(
                in: .whitespacesAndNewlines
            )
                .isEmpty
        else {
            return
        }
        
        // ViewModel/API call later
        messageText = ""
    }
    
     func scrollToLastMessage(
        proxy: ScrollViewProxy
    ) {
        
        guard let lastMessage = messages.last else {
            return
        }
        
        DispatchQueue.main.async {
            
            proxy.scrollTo(
                lastMessage.id,
                anchor: .bottom
            )
        }
    }
}

//MARK: - ------------------------------------------------
//MARK: - OfficeHoursNoticeView View
private struct OfficeHoursNoticeView: View {

    let notice: OfficeHoursNotice

    var body: some View {

        HStack(
            alignment: .top,
            spacing: 7
        ) {

            Image(
                systemName: "alarm.fill"
            )
            .font(.system(size: 11))
            .foregroundColor(.orange)

            Text(notice.message)
                .font(.system(size: 10))
                .foregroundColor(
                    Color(.systemBrown)
                )
                .multilineTextAlignment(.center)
                .lineSpacing(2)
        }
        .frame(
            maxWidth: .infinity
        )
        .padding(.horizontal, 12)
        .padding(.vertical, 8)
        .background(
            Color.yellow.opacity(0.10)
        )
        .overlay(
            RoundedRectangle(
                cornerRadius: 9
            )
            .stroke(
                Color.orange.opacity(0.45),
                lineWidth: 0.8
            )
        )
        .clipShape(
            RoundedRectangle(
                cornerRadius: 9
            )
        )
    }
}

//MARK: - ------------------------------------------------
//MARK: - View AutoReplyNoticeView
private struct AutoReplyNoticeView: View {

    var body: some View {

        VStack(
            alignment: .leading,
            spacing: 4
        ) {

            Text(
                "Thank you for your message. " +
                "This is an auto-reply."
            )
            .font(
                .system(
                    size: 10,
                    weight: .medium
                )
            )
            .foregroundColor(
                Color(.systemBrown)
            )

            Text(
                "Office hours are 3:00 PM – 5:00 PM. " +
                "I will respond during the next office hours."
            )
            .font(.system(size: 9))
            .foregroundColor(
                Color(.systemBrown)
            )

            Text("Sent automatically")
                .font(
                    .system(
                        size: 8,
                        weight: .medium
                    )
                )
                .foregroundColor(
                    .secondary
                )
                .italic()
        }
        .frame(
            maxWidth: .infinity,
            alignment: .leading
        )
        .padding(10)
        .background(
            Color.yellow.opacity(0.08)
        )
        .overlay(
            RoundedRectangle(
                cornerRadius: 8
            )
            .stroke(
                Color.orange.opacity(0.4),
                lineWidth: 0.8
            )
        )
        .clipShape(
            RoundedRectangle(
                cornerRadius: 8
            )
        )
    }
}

//MARK: - ------------------------------------------------
//MARK: - View MessageInputView
private struct MessageInputView: View {

    @Binding var text: String

    let onAttachment: () -> Void
    let onSend: () -> Void

    var body: some View {

        HStack(
            alignment: .center,
            spacing: 8
        ) {

            Button {
                onAttachment()
            } label: {

                Image(
                    systemName: "paperclip"
                )
                .font(
                    .system(
                        size: 18,
                        weight: .medium
                    )
                )
                .foregroundColor(.secondary)
            }
            .frame(
                width: 30,
                height: 40
            )

            HStack {

                TextField(
                    "Type a message...",
                    text: $text
                )
                .font(.system(size: 12))
                .textInputAutocapitalization(.sentences)
                .submitLabel(.send)
                .onSubmit {
                    onSend()
                }
            }
            .padding(.horizontal, 12)
            .frame(height: 34)
            .background(
                Color(.systemGray6)
            )
            .overlay(
                Capsule()
                    .stroke(
                        Color(.systemGray4),
                        lineWidth: 0.6
                    )
            )
            .clipShape(Capsule())

            Button {
                onSend()
            } label: {

                Image(
                    systemName: "arrow.up"
                )
                .font(
                    .system(
                        size: 13,
                        weight: .bold
                    )
                )
                .foregroundColor(.white)
                .frame(
                    width: 30,
                    height: 30
                )
                .background(
                    Circle()
                        .fill(Color.blue)
                )
            }
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 7)
        .background(Color.white)
        .overlay(
            Rectangle()
                .frame(height: 0.5)
                .foregroundColor(
                    Color(.systemGray4)
                ),
            alignment: .top
        )
    }
}

#Preview {
    MessageDetailView(messages: ChatMessageEntity.mockData)
}
