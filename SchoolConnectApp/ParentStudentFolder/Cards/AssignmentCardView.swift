//
//  AssignmentCardView.swift
//  SchoolConnectApp
//
//  Created by Aditya Maroo on 17/09/2026.
//


import SwiftUI

struct AssignmentCardView: View {
    
    let assignment: AssignmentEntity
    
    var body: some View {
        
        HStack(spacing: 0) {
            
            // Left colored indicator
            RoundedRectangle(cornerRadius: 4)
                .fill(assignment.subject.cardColor)
                .frame(width: 3)
            
            VStack(
                alignment: .leading,
                spacing: 6
            ) {
                
                // MARK: - Top Row
                HStack {
                    
                    SubjectBadgeView(
                        subject: assignment.subject
                    )
                    
                    Spacer()
                    
                    DueDateView(
                        assignment: assignment
                    )
                }
                
                // MARK: - Title
                Text(assignment.title)
                    .font(
                        .system(
                            size: 13,
                            weight: .bold
                        )
                    )
                    .foregroundColor(.primary)
                
                // MARK: - Description
                Text(assignment.description)
                    .font(.system(size: 10))
                    .foregroundColor(.secondary)
                    .lineLimit(2)
                
                // MARK: - Bottom Row
                HStack {
                    
                    AttachmentInfoView(
                        attachmentCount:
                            assignment.attachmentCount
                    )
                    
                    Text(assignment.teacherName)
                        .font(.system(size: 9))
                        .foregroundColor(.secondary)
                    
                    Spacer()
                    
                    CompletionView(
                        isCompleted:
                            assignment.isCompleted
                    )
                }
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 10)
        }
        .background(Color.white)
        .clipShape(
            RoundedRectangle(cornerRadius: 10)
        )
    }
}

//MARK: - ------------------------------------------------
//MARK: - Subject Batch View
 struct SubjectBadgeView: View {
    
    let subject: Subject
    
    var body: some View {
        
        Text(subject.title)
            .font(
                .system(
                    size: 8,
                    weight: .bold
                )
            )
            .foregroundColor(subject.textColor)
            .padding(.horizontal, 7)
            .padding(.vertical, 3)
            .background(
                Capsule()
                    .fill(subject.backgroundColor)
            )
    }
}

//MARK: - ------------------------------------------------
//MARK: - DueDateView View
private struct DueDateView: View {
    
    let assignment: AssignmentEntity
    
    var body: some View {
        
        Text(dueText)
            .font(
                .system(
                    size: 8,
                    weight: .semibold
                )
            )
            .foregroundColor(
                assignment.status.foregroundColor
            )
            .padding(.horizontal, 7)
            .padding(.vertical, 3)
            .background(
                Capsule()
                    .fill(
                        assignment.status.backgroundColor
                    )
            )
        
    }
    private var dueText: String {
        
        switch assignment.status {
                
            case .overdue:
                return "OVERDUE 1D"
                
            case .dueTomorrow:
                return "DUE TOMORROW"
                
            case .upcoming:
                return assignment.dueDate.formatted(
                    .dateTime
                        .month(.abbreviated)
                        .day()
                )
                
            case .completed:
                return "COMPLETED"
        }
    }
}

private struct AttachmentInfoView: View {
    
    let attachmentCount: Int
    
    var body: some View {
        
        if attachmentCount > 0 {
            
            HStack(spacing: 3) {
                
                Image(systemName: "paperclip")
                    .font(.system(size: 9))
                
                Text(
                    "\(attachmentCount) file" +
                    (attachmentCount > 1 ? "s" : "")
                )
                .font(.system(size: 9))
            }
            .foregroundColor(.secondary)
        }
    }
}

private struct CompletionView: View {
    
    let isCompleted: Bool
    
    var body: some View {
        
        HStack(spacing: 7) {
            
            RoundedRectangle(cornerRadius: 4)
                .fill(
                    isCompleted
                    ? Color.green
                    : Color.white
                )
                .frame(width: 18, height: 18)
                .overlay {
                    
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(
                            isCompleted
                            ? Color.green
                            : Color(.systemGray4),
                            lineWidth: 0.8
                        )
                    
                    if isCompleted {
                        Image(systemName: "checkmark")
                            .font(
                                .system(
                                    size: 10,
                                    weight: .bold
                                )
                            )
                            .foregroundColor(.white)
                    }
                }
            
            Text(
                isCompleted
                ? "Done"
                : "Done"
            )
            .font(
                .system(
                    size: 10,
                    weight: .medium
                )
            )
            .foregroundColor(
                isCompleted
                ? .green
                : .secondary
            )
        }
    }
}



private extension Subject {
    
    var cardColor: Color {
        
        switch self {
            case .math:
                return .red
                
            case .english:
                return .orange
                
            case .science:
                return .blue
                
            case .hindi:
                return .blue
        }
    }
    
    var textColor: Color {
        
        switch self {
            case .math:
                return .orange
                
            case .english:
                return .orange
                
            case .science:
                return .orange
                
            case .hindi:
                return .orange
        }
    }
    
    var backgroundColor: Color {
        Color.orange.opacity(0.10)
    }
}

extension AssignmentStatus {
    
    var foregroundColor: Color {
        
        switch self {
                
            case .overdue:
                return .red
                
            case .dueTomorrow:
                return .orange
                
            case .upcoming:
                return .secondary
                
            case .completed:
                return .green
        }
    }
    
    var backgroundColor: Color {
        
        switch self {
                
            case .overdue:
                return Color.red.opacity(0.10)
                
            case .dueTomorrow:
                return Color.orange.opacity(0.12)
                
            case .upcoming:
                return Color.clear
                
            case .completed:
                return Color.green.opacity(0.10)
        }
    }
}
