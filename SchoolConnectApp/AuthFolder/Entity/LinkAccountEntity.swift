//
//  LinkAccountEntity.swift
//  SchoolConnectApp
//
//  Created by Aditya Maroo on 15/09/2026.
//

import Foundation

struct LinkAccountEntity: Identifiable{
    let id: Int
    let name: String
    let grade: String
    let section: String
    let roll: String
}

// MARK: - For Model Mapping to Entity
extension LinkAccountEntity {
    
    // Example mapper
    /*
    init(model: LinkAccountModel) {
        self.id = model.id
        self.name = model.name
        self.grade = model.grade
        self.section = model.section
        self.roll = model.roll
    }
    */
}

extension LinkAccountEntity {
    
    static func mockData() -> [LinkAccountEntity] {
        [
            LinkAccountEntity(
                id: 1,
                name: "John Doe",
                grade: "10",
                section: "A",
                roll: "101"
            ),
            LinkAccountEntity(
                id: 2,
                name: "Emma Smith",
                grade: "10",
                section: "B",
                roll: "102"
            ),
            LinkAccountEntity(
                id: 3,
                name: "Michael Johnson",
                grade: "11",
                section: "A",
                roll: "103"
            ),
            LinkAccountEntity(
                id: 4,
                name: "Sophia Brown",
                grade: "12",
                section: "C",
                roll: "104"
            )
        ]
    }
}
