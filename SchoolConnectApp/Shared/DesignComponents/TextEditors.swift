//
//  TextEditors.swift
//  SchoolConnectApp
//
//  Created by Aditya Maroo on 16/09/2026.
//

import SwiftUI

struct LeaveRequestTextEditor: View {

    let title: String
    let placeholder: String
    @Binding var text: String

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {

            Text(title)
                .font(.system(size: 11, weight: .semibold))
                .foregroundColor(.secondary)

            ZStack(alignment: .topLeading) {

                RoundedRectangle(cornerRadius: 7)
                    .fill(Color.white)

                RoundedRectangle(cornerRadius: 7)
                    .stroke(
                        Color(.systemGray4),
                        lineWidth: 0.8
                    )

                if text.isEmpty {
                    Text(placeholder)
                        .font(.system(size: 13))
                        .foregroundColor(.secondary)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 11)
                }

                TextEditor(text: $text)
                    .font(.system(size: 13))
                    .padding(.horizontal, 8)
                    .padding(.vertical, 5)
                    .background(Color.clear)
            }
            .frame(height: 80)
        }
    }
}
