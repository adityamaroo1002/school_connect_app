//
//  NotificationCard 2.swift
//  SchoolConnectApp
//
//  Created by Aditya Maroo on 15/09/2026.
//


import SwiftUI

struct NotificationCard: View {
    
    let notification: NotificationEntity
    
    var body: some View {
        
        HStack(alignment: .top, spacing: 12) {
            
            iconView
            
            VStack(alignment: .leading, spacing: 4) {
                
                Text(notification.title)
                    .font(.system(size: 14, weight: .semibold))
                    .multilineTextAlignment(.leading)
                
                Text(notification.date.relativeTime)
                    .font(.system(size: 12))
                    .foregroundStyle(.secondary)
            }
            
            Spacer()
            
            if notification.isUnread {
                Circle()
                    .fill(.blue)
                    .frame(width: 8, height: 8)
                    .padding(.top, 4)
            }
        }
        .padding(12)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .overlay {
            RoundedRectangle(cornerRadius: 16)
                .stroke(.gray.opacity(0.15))
        }
    }
}

//MARK: - ------------------------------------------------
//MARK: - View Component Extension
private extension NotificationCard {
    
    var iconView: some View {
        
        Image(systemName: notification.type.systemImage)
            .font(.system(size: 18, weight: .semibold))
            .foregroundStyle(notification.type.iconColor)
            .frame(width: 40, height: 40)
            .background(notification.type.iconBackground)
            .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

//MARK: - ------------------------------------------------
//MARK: - For Setting Notification Image from System Default
extension NotificationType {
    
    var systemImage: String {
        switch self {
        case .announcement:
            return "megaphone.fill"
            
        case .approval:
            return "checkmark.square.fill"
            
        case .message:
            return "ellipsis.message.fill"
            
        case .reminder:
            return "pencil.and.list.clipboard"
        }
    }
    
    var iconBackground: Color {
        switch self {
        case .announcement:
            return .blue.opacity(0.12)
            
        case .approval:
            return .green.opacity(0.12)
            
        case .message:
            return .purple.opacity(0.12)
            
        case .reminder:
            return .orange.opacity(0.12)
        }
    }
    
    var iconColor: Color {
        switch self {
        case .announcement:
            return .blue
            
        case .approval:
            return .green
            
        case .message:
            return .purple
            
        case .reminder:
            return .orange
        }
    }
}

#Preview {
    NotificationCard(notification: NotificationEntity.mockData().first!)
}
