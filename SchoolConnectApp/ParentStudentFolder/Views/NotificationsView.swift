//
//  NotificationsView.swift
//  SchoolConnectApp
//
//  Created by Aditya Maroo on 15/09/2026.
//

import SwiftUI

struct NotificationsView: View {
    var body: some View {
        setup
    }
}

//MARK: - ------------------------------------------------
//MARK: - View Component Extension
private extension NotificationsView{
    var setup: some View{
        notificationList
            .background(Color(.systemGroupedBackground))
    }
    
    var notificationList: some View{
        ScrollView{
            LazyVStack(spacing: 4){
                ForEach(NotificationEntity.mockData()){notification in
                    NotificationCard(notification: notification)
                }
            }
            .padding(20)
        }
        .padding(.top, 1)
    }
}

#Preview {
    NotificationsView()
}
