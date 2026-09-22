//
//  NoticeCardView.swift
//  SchoolConnectApp
//
//  Created by Aditya Maroo on 18/09/2026.
//
import SwiftUI

struct NoticeCardView: View {
    
    let notice: NoticeEntity
    
    var body: some View {
        
        VStack(
            alignment: .leading,
            spacing: 7
        ) {
            
            NoticeHeaderView(
                notice: notice
            )
            
            Text(notice.title)
                .font(
                    .system(
                        size: 13,
                        weight: .bold
                    )
                )
                .foregroundColor(.primary)
            
            Text(notice.message)
                .font(.system(size: 10.5))
                .foregroundColor(.secondary)
                .lineSpacing(3)
                .fixedSize(
                    horizontal: false,
                    vertical: true
                )
            
            HStack(spacing: 8) {

                if notice.attachmentCount > 0 {

                    NoticeAttachmentView(
                        count: notice.attachmentCount
                    )
                }

                NoticeReadStatusView(
                    isRead: notice.isRead
                )

                Spacer()
            }
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 11)
        .frame(
            maxWidth: .infinity,
            alignment: .leading
        )
        .background(Color.white)
        .clipShape(
            RoundedRectangle(
                cornerRadius: 11,
                style: .continuous
            )
        )
    }
}

private struct NoticeHeaderView: View {

    let notice: NoticeEntity

    var body: some View {

        HStack(
            alignment: .center,
            spacing: 5
        ) {

            ForEach(
                Array(notice.tags.enumerated()),
                id: \.offset
            ) { _, tag in

                NoticeTagView(
                    tag: tag
                )
            }

            Spacer()

            Text(formattedDate)
                .font(.system(size: 8))
                .foregroundColor(.secondary)
        }
    }

    private var formattedDate: String {

        notice.postedDate.formatted(
            .dateTime
                .month(.abbreviated)
                .day()
        )
    }
}


private struct NoticeTagView: View {

    let tag: NoticeTagEnum

    var body: some View {

        Text(tag.title)
            .font(
                .system(
                    size: 7.5,
                    weight: .bold
                )
            )
            .foregroundColor(tag.textColor)
            .padding(.horizontal, 7)
            .padding(.vertical, 3)
            .background(
                Capsule()
                    .fill(tag.backgroundColor)
            )
    }
}


private struct NoticeAttachmentView: View {

    let count: Int

    var body: some View {

        HStack(spacing: 4) {

            Image(systemName: "paperclip")
                .font(.system(size: 9))

            Text(
                "\(count) " +
                (count == 1
                 ? "attachment"
                 : "attachments")
            )
            .font(.system(size: 8.5))
        }
        .foregroundColor(.secondary)
    }
}



private struct NoticeReadStatusView: View {

    let isRead: Bool

    var body: some View {

        HStack(spacing: 3) {

            Image(
                systemName: "checkmark"
            )
            .font(
                .system(
                    size: 8,
                    weight: .bold
                )
            )

            Text(
                isRead
                ? "Read"
                : "Unread"
            )
            .font(.system(size: 8.5))
        }
        .foregroundColor(
            isRead
            ? .green
            : .secondary
        )
    }
}

private extension NoticeTagEnum{
    var textColor: Color {

            switch self {

            case .highPriority:
                return .red

            case .school:
                return .blue

            case .classTag:
                return .blue
            }
        }

        var backgroundColor: Color {

            switch self {

            case .highPriority:
                return Color.red.opacity(0.10)

            case .school:
                return Color.blue.opacity(0.08)

            case .classTag:
                return Color.blue.opacity(0.08)
            }
        }
}
