//
//  HomeFeedEntity.swift
//  SchoolConnectApp
//
//  Created by Aditya Maroo on 15/09/2026.
//

import Foundation

struct FeedEntity: Identifiable{
    let id: Int
    let categoryTag: String
    let date: String
    let title: String
    let body: String
    let priorityStatus: String?
    let imageCount: String?
}

//MARK: - ------------------------------------------------
//MARK: - For Model Mapping to Entity
extension FeedEntity{
    
}

//MARK: - ------------------------------------------------
//MARK: - Mock Data
extension FeedEntity{
    static func mockData() -> [FeedEntity] {
            [
                FeedEntity(
                    id: 1,
                    categoryTag: "Announcement",
                    date: "2026-09-15T10:30:00Z".relativeTime() ?? "Invalid Date",
                    title: "Annual Sports Day",
                    body: "Our annual sports day will be held this Friday.",
                    priorityStatus: "High",
                    imageCount: "3"
                ),
                FeedEntity(
                    id: 2,
                    categoryTag: "News",
                    date: "2026-09-14T08:00:00Z".relativeTime() ?? "Invalid Date",
                    title: "New Library Books",
                    body: "New books have been added to the school library.",
                    priorityStatus: "Medium",
                    imageCount: "5"
                ),
                FeedEntity(
                    id: 3,
                    categoryTag: "Notice",
                    date: "2026-09-13T12:00:00Z".relativeTime() ?? "Invalid Date",
                    title: "Mid-Term Examination",
                    body: "The examination schedule has been published.",
                    priorityStatus: "High",
                    imageCount: "0"
                )
            ]
        }
}
