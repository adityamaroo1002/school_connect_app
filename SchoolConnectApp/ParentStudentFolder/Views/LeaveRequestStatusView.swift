//
//  LeaveRequestStatusView.swift
//  SchoolConnectApp
//
//  Created by Aditya Maroo on 16/09/2026.
//

import SwiftUI

struct LeaveRequestStatusView: View {
    @State private var selectedFilter: LeaveFilter = .all
    
    private var filteredItems: [LeaveRequestEntity] {
        
        switch selectedFilter {
                
            case .all:
                return LeaveRequestEntity.mockData
                
            case .pending:
                return LeaveRequestEntity.mockData.filter { $0.status == .pending }
                
            case .approved:
                return LeaveRequestEntity.mockData.filter { $0.status == .approved }
                
            case .rejected:
                return LeaveRequestEntity.mockData.filter { $0.status == .rejected }
        }
    }
    
    var body: some View {
        setup
    }
}

//MARK: - ------------------------------------------------
//MARK: - View Component Extension
private extension LeaveRequestStatusView{
    
    var setup: some View{
        VStack(spacing: 20){
            LeaveFilterSectionView(
                selectedFilter: $selectedFilter
            )
            leaveRequestList
        }
        .background(
            Color(.systemGroupedBackground)
        )
    }
    
    var leaveRequestList: some View{
        ScrollView {
            
            LazyVStack(spacing: 12) {
                
                ForEach(LeaveRequestEntity.mockData) { item in
                    LeaveRequestCardView(item: item)
                }
            }
            .padding(20)
        }
    }
}

//MARK: - ------------------------------------------------
//MARK: - New View Component
private struct LeaveFilterChipView: View {
    
    let title: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        
        Button(action: action) {
            
            Text(title)
                .font(.system(size: 14, weight: .semibold))
                .foregroundStyle(
                    isSelected
                    ? Color.white
                    : Color.secondary
                )
                .padding(.horizontal, 16)
                .padding(.vertical, 10)
                .background(
                    isSelected
                    ? Color.blue
                    : Color(.systemGray6)
                )
                .clipShape(Capsule())
        }
        .buttonStyle(.plain)
    }
}

private struct LeaveFilterSectionView: View {
    
    @Binding var selectedFilter: LeaveFilter
    
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false) {
            
            HStack(spacing: 8) {
                
                ForEach(LeaveFilter.allCases) { filter in
                    
                    LeaveFilterChipView(
                        title: filter.rawValue,
                        isSelected: selectedFilter == filter
                    ) {
                        selectedFilter = filter
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    LeaveRequestStatusView()
}
