//
//  SettingRowView.swift
//  SchoolConnectApp
//
//  Created by Aditya Maroo on 18/09/2026.
//


import SwiftUI

struct SettingRowView: View {
    
    let setting: SettingItemEntity
    let action: () -> Void
    
    var body: some View {
        
        Button {
            action()
        } label: {
            
            HStack(spacing: 11) {
                
                ZStack {
                    
                    RoundedRectangle(
                        cornerRadius: 6
                    )
                    .fill(
                        setting.iconBackground
                    )
                    
                    Image(
                        systemName: setting.icon
                    )
                    .font(.system(size: 14))
                    .foregroundColor(
                        iconColor
                    )
                }
                .frame(
                    width: 28,
                    height: 28
                )
                
                Text(setting.title)
                    .font(.system(size: 11))
                    .foregroundColor(.primary)
                
                Spacer()
                
                Image(
                    systemName: "chevron.right"
                )
                .font(
                    .system(
                        size: 9,
                        weight: .medium
                    )
                )
                .foregroundColor(.secondary)
            }
            .padding(.horizontal, 2)
            .frame(height: 52)
//            .overlay(
//                Divider(),
//                alignment: .bottom
//            )
        }
        .buttonStyle(.plain)
    }
    
    private var iconColor: Color {
        
        switch setting.type {
                
            case .notification:
                return .orange
                
            case .password:
                return .secondary
                
            case .language:
                return .cyan
                
            case .biometric:
                return .purple
                
            case .help:
                return .red
                
            case .privacy:
                return .secondary
                
            case .terms:
                return .secondary
        }
    }
}
