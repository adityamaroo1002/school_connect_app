//
//  FeedCard.swift
//  SchoolConnectApp
//
//  Created by Aditya Maroo on 15/09/2026.
//

import SwiftUI

struct FeedCard: View {
    let data: FeedEntity
    var body: some View {
        setup
    }
}

//MARK: - ------------------------------------------------
//MARK: - View Component Extension
private extension FeedCard{
    
    var setup: some View{
        VStack(alignment: .leading, spacing: 12){
            header
            content
            footer
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(16)
        .background{
            RoundedRectangle(cornerRadius: 12)
                .fill(.white)
        }
    }
    
    var header: some View{
        HStack(spacing: 12){
            categoryTage
            Spacer()
            dateLabel
        }
    }
    
    var categoryTage: some View{
        Text(data.categoryTag)
            .font(.system(size: 14, weight: .semibold))
            .foregroundStyle(data.categoryTagColor)
            .padding(.horizontal,10)
            .padding(.vertical, 4)
            .background{
                Capsule()
                    .fill(data.categoryTagColor.opacity(0.3))
            }
    }
    
    var dateLabel: some View{
        Text(data.date)
            .font(.system(size: 14, weight: .regular))
            .foregroundStyle(.gray)
    }
    
    var content: some View{
        VStack(alignment: .leading, spacing: 6) {
            title
            bodyContent
        }
    }
    
    var title: some View{
        Text(data.title)
            .font(.system(size: 16, weight: .semibold))
            .foregroundStyle(.black)
    }
    
    var bodyContent: some View{
        Text(data.body)
            .font(.system(size: 14, weight: .regular))
            .foregroundStyle(.gray)
            .multilineTextAlignment(.leading)
        
    }
    
    var footer: some View{
        HStack(spacing: 10){
            footerTag
            attachmentCount
        }
    }
    
    @ViewBuilder
    var footerTag: some View{
        if let priority = data.priorityStatus{
            Text(priority)
                .font(.system(size: 14, weight: .semibold))
                .foregroundStyle(.white)
                .padding(.horizontal,10)
                .padding(.vertical, 4)
                .background{
                    Capsule()
                        .fill(data.priorityTagColor.opacity(0.7))
                }
        }
    }
    
    var attachmentCount: some View{
        HStack(spacing: 3){
            Image(systemName: "paperclip")
            if let count = data.imageCount{
                Text(count)
                    .font(.system(size: 14, weight: .medium))
                    .foregroundStyle(.gray)
            }
        }
    }
}

//MARK: - ------------------------------------------------
//MARK: - FeedEntity Extension
extension FeedEntity {
    
    var categoryTagColor: Color {
        switch categoryTag.lowercased() {
            case "announcement":
                    .blue
                
            case "news":
                    .green
                
            case "notice":
                    .orange
                
            case "event":
                    .purple
                
            default:
                    .gray
        }
    }
    
    var priorityTagColor: Color {
        switch priorityStatus?.lowercased() {
            case "high":
                    .red
                
            case "medium":
                    .orange
                
            case "low":
                    .pink
                
            case "completed":
                    .green
                
            default:
                    .yellow
        }
    }
}


#Preview {
    FeedCard(data: FeedEntity.mockData().first!)
}
