//
//  AttendanceAlertCard.swift
//  SchoolConnectApp
//
//  Created by Aditya Maroo on 21/09/2026.
//


import SwiftUI

struct AttendanceAlertCard: View {
    
    let alert: AttendanceAlert
    
    var body: some View {
        
        HStack(spacing: 10) {
            
            RoundedRectangle(
                cornerRadius: 2
            )
            .fill(alertColor)
            .frame(
                width: 3,
                height: 28
            )
            
            VStack(
                alignment: .leading,
                spacing: 3
            ) {
                
                Text(alert.title)
                    .font(
                        .system(
                            size: 10,
                            weight: .semibold
                        )
                    )
                
                Text(alert.subtitle)
                    .font(.system(size: 8))
                    .foregroundColor(.secondary)
            }
            
            Spacer()
        }
        .padding(.horizontal, 12)
        .frame(height: 52)
        .background(Color.white)
        .clipShape(
            RoundedRectangle(
                cornerRadius: 10
            )
        )
    }
    
    private var alertColor: Color {
        
        switch alert.type {
                
            case .absent:
                return .red
                
            case .late:
                return .orange
                
            case .present:
                return .green
        }
    }
}
