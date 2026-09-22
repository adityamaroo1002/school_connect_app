//
//  LeaveRequestCardView.swift
//  SchoolConnectApp
//
//  Created by Aditya Maroo on 16/09/2026.
//


import SwiftUI

struct LeaveRequestCardView: View {
    
    let item: LeaveRequestEntity
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 12) {
            
            header
            
            Text(item.description)
                .font(.subheadline)
                .foregroundStyle(.secondary)
            
            footer
        }
        .padding(16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.white)
        .clipShape(
            RoundedRectangle(cornerRadius: 16)
        )
        .shadow(
            color: .black.opacity(0.04),
            radius: 4,
            y: 2
        )
    }
}

private extension LeaveRequestCardView {
    
    var header: some View {
        HStack(alignment: .top) {
            
            Text(item.title)
                .font(.headline)
                .fontWeight(.semibold)
            
            Spacer()
            
            statusView
        }
    }
    
    var footer: some View {
        
        Group {
            
            if let actionMessage = item.actionMessage {
                
                Text(actionMessage)
                    .font(.caption)
                    .foregroundStyle(.secondary)
                
            } else {
                
                Text(item.submittedDate)
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
        }
    }
    
    var statusView: some View {
        
        Text(item.status.title)
            .font(.caption2)
            .fontWeight(.bold)
            .padding(.horizontal, 10)
            .padding(.vertical, 5)
            .background(statusBackground)
            .foregroundStyle(statusForeground)
            .clipShape(Capsule())
    }
    
    var statusBackground: Color {
        switch item.status {
        case .pending:
            Color.orange.opacity(0.15)
        case .approved:
            Color.green.opacity(0.15)
        case .rejected:
            Color.red.opacity(0.15)
        }
    }
    
    var statusForeground: Color {
        switch item.status {
        case .pending:
            .orange
        case .approved:
            .green
        case .rejected:
            .red
        }
    }
}

#Preview {
    LeaveRequestCardView(item: LeaveRequestEntity.mockData.first!)
}
