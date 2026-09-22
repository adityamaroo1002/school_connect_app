//
//  AttendanceStatCard.swift
//  SchoolConnectApp
//
//  Created by Aditya Maroo on 16/09/2026.
//


import SwiftUI

struct AttendanceStatCard: View {

    let count: Int
    let title: String
    let color: Color

    var body: some View {
        VStack(spacing: 4) {

            Text("\(count)")
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(color)

            Text(title)
                .font(.system(size: 10, weight: .bold))
                .foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 53)
        .background(Color.white)
        .clipShape(
            RoundedRectangle(cornerRadius: 11)
        )
    }
}

//MARK: - ------------------------------------------------
//MARK: - Attendance Row View
struct AttendanceRowView: View {

    let record: AttendanceRecordEntity

    var body: some View {
        HStack {

            Text(record.date)
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(.primary)

            Spacer()

            Text(record.status.title)
                .font(.system(size: 10, weight: .bold))
                .foregroundColor(record.status.foregroundColor)
                .padding(5)
                .background(
                    record.status.backgroundColor
                )
                .clipShape(Capsule())
        }
        .padding(12)
        .background(Color.white)
        .clipShape(
            RoundedRectangle(cornerRadius: 10)
        )
    }
}

private extension AttendanceStatus {
    
    var foregroundColor: Color {
        switch self {
        case .present:
            return .green

        case .absent:
            return .red

        case .late:
            return .orange
        }
    }

    var backgroundColor: Color {
        switch self {
        case .present:
            return Color.green.opacity(0.10)

        case .absent:
            return Color.red.opacity(0.10)

        case .late:
            return Color.orange.opacity(0.12)
        }
    }
}
