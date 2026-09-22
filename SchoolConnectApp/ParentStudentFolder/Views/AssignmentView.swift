//
//  AssignmentView.swift
//  SchoolConnectApp
//
//  Created by Aditya Maroo on 17/09/2026.
//


import SwiftUI

struct AssignmentView: View {

    var body: some View {
        setup
    }
}


//MARK: - ------------------------------------------------
//MARK: - View Component Extension
private extension AssignmentView{
    
    var setup: some View{
        VStack(spacing: 20) {

            // Your existing header
            // AssignmentHeaderView()

            AssignmentFilterView(
                selectedFilter: .constant(.all)
            )

            Divider()
                .padding(.horizontal, 20)

            ScrollView(showsIndicators: false) {

                AssignmentListView(
                    assignments: AssignmentEntity.mockData
                )
                .padding(.horizontal, 20)
              
            }
        }
        .padding(.vertical, 20)
        .background(
            Color(.systemGroupedBackground)
        )
    }
}

//MARK: - ------------------------------------------------
//MARK: - Filter View
private struct AssignmentFilterView: View {
    
    @Binding var selectedFilter: AssignmentFilter

    var body: some View {

        ScrollView(
            .horizontal,
            showsIndicators: false
        ) {

            HStack(spacing: 7) {

                ForEach(
                    AssignmentFilter.allCases,
                    id: \.self
                ) { filter in

                    FilterButton(
                        title: filter.title,
                        isSelected: selectedFilter == filter
                    ) {
                        selectedFilter = filter
                    }
                }
            }
            .padding(.horizontal, 20)
        }
    }
}

private struct FilterButton: View {

    let title: String
    let isSelected: Bool
    let action: () -> Void

    var body: some View {

        Button(action: action) {

            Text(title)
                .font(
                    .system(
                        size: 10,
                        weight: isSelected ? .semibold : .medium
                    )
                )
                .foregroundColor(
                    isSelected
                    ? .white
                    : .secondary
                )
                .padding(.horizontal, 13)
                .frame(height: 25)
                .background(
                    Capsule()
                        .fill(
                            isSelected
                            ? Color.blue
                            : Color.white
                        )
                )
                .overlay(
                    Capsule()
                        .stroke(
                            isSelected
                            ? Color.clear
                            : Color(.systemGray4),
                            lineWidth: 0.6
                        )
                )
        }
        .buttonStyle(.plain)
    }
}

//MARK: - ------------------------------------------------
//MARK: - AssignmentListView
private struct AssignmentListView: View {
    
    var assignments: [AssignmentEntity]

    var body: some View {

        LazyVStack(spacing: 8) {

            ForEach(assignments) { assignment in

                AssignmentCardView(
                    assignment: assignment
                )
            }
        }
    }
}

#Preview {
    AssignmentView()
}
