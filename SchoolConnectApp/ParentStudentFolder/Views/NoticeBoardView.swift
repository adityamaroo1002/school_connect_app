//
//  NoticeBoardView.swift
//  SchoolConnectApp
//
//  Created by Aditya Maroo on 18/09/2026.
//


import SwiftUI

struct NoticeBoardView: View {

    let notices: [NoticeEntity]

    var body: some View {

        VStack(spacing: 0) {

            // Keep your existing header
            // NoticeBoardHeaderView()

            ScrollView(
                showsIndicators: false
            ) {

                NoticeListView(
                    notices: notices
                )
                .padding(.horizontal, 12)
                .padding(.top, 12)
                .padding(.bottom, 20)
            }

            // Keep your existing bottom tab bar
            // MainTabBar()
        }
        .background(
            Color(.systemGroupedBackground)
        )
    }
}


private struct NoticeListView: View {

    let notices: [NoticeEntity]

    var body: some View {

        LazyVStack(spacing: 9) {

            ForEach(notices) { notice in

                NoticeCardView(
                    notice: notice
                )
            }
        }
    }
}

#Preview {
    NoticeBoardView(notices: NoticeEntity.mockData)
}
