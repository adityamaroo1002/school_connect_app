//
//  LinkAccountCard.swift
//  SchoolConnectApp
//
//  Created by Aditya Maroo on 15/09/2026.
//

import SwiftUI

struct LinkAccountCard: View {
    let data: LinkAccountEntity
    var body: some View {
        setup
    }
}

//MARK: - ------------------------------------------------
//MARK: - View Component Extension
private extension LinkAccountCard{
    
    var setup: some View{
        VStack(alignment: .leading, spacing: 5){
            name
            classDetail
        }
        .padding(16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background{
            RoundedRectangle(cornerRadius: 12)
                .fill(.white)
        }
    }
    
    var name: some View{
        Text(data.name)
            .font(.system(size: 16, weight: .regular))
            .foregroundStyle(.black)
    }
    var classDetail: some View{
        HStack(spacing: 4){
            labelValue(label: "Grade", value: data.grade)
            dot
            labelValue(label: "Section", value: data.section)
            dot
            labelValue(label: "Roll", value: data.roll)
        }
    }
    
    private func labelValue(label: String, value: String)-> some View{
        HStack(spacing: 3){
             Text(label)
                 .font(.system(size: 14))
                 .foregroundStyle(.gray)
             Text(value)
                 .font(.system(size: 14))
                 .foregroundStyle(.gray)
        }
    }
    
    var dot: some View{
        Circle()
            .fill(.gray)
            .frame(width: 5)
    }
}

#Preview {
    LinkAccountCard(data: LinkAccountEntity.mockData().first!)
}
