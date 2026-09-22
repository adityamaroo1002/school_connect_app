//
//  AssignmentDetailView.swift
//  SchoolConnectApp
//
//  Created by Aditya Maroo on 18/09/2026.
//


import SwiftUI

struct AssignmentDetailView: View {

    @State private var isCompleted = false

    let assignment: AssignmentDetailEntity

    var body: some View {
        setup
    }
}

//MARK: - ------------------------------------------------
//MARK: - View Component Extension
private extension AssignmentDetailView{
    
    var setup: some View{
        
        VStack(spacing: 0) {

            // Keep your existing header
            // AssignmentDetailHeaderView()

            ScrollView(
                showsIndicators: false
            ) {

                VStack(
                    alignment: .leading,
                    spacing: 18
                ) {

                    AssignmentHeaderView(
                        assignment: assignment
                    )

                    AssignmentInstructionsView(
                        instructions:
                            assignment.instructions
                    )

                    if let attachment = assignment.attachment {

                        AssignmentAttachmentView(
                            attachment: attachment
                        )
                    }

                    TeacherContactView(
                        teacherName:
                            assignment.teacherName,
                        teacherRole:
                            assignment.teacherRole,
                        grade:
                            assignment.grade
                    )
                }
                .padding(.horizontal, 17)
                .padding(.top, 12)
                .padding(.bottom, 20)
            }

            // Keep this as your bottom action area
            AssignmentCompletionView(
                isCompleted: $isCompleted
            )
        }
        .background(
            Color(.systemGroupedBackground)
        )
    }
}

//MARK: - ------------------------------------------------
//MARK: - AssignmentHeaderView
private struct AssignmentHeaderView: View {

    let assignment: AssignmentDetailEntity

    var body: some View {

        VStack(
            alignment: .leading,
            spacing: 6
        ) {

            SubjectBadgeView(
                subject: assignment.subject
            )

            Text(assignment.title)
                .font(
                    .system(
                        size: 17,
                        weight: .bold
                    )
                )
                .foregroundColor(.primary)

            HStack(spacing: 5) {

                Text(assignment.teacherName)

                Text("•")

                Text(
                    "Posted \(postedDate)"
                )
            }
            .font(.system(size: 10))
            .foregroundColor(.secondary)

            AssignmentOverdueBadge(days: 1)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }

    private var postedDate: String {

        assignment.postedDate.formatted(
            .dateTime
                .month(.abbreviated)
                .day()
        )
    }
}

//MARK: - ------------------------------------------------
//MARK: - AssignmentOverdueBadge View
private struct AssignmentOverdueBadge: View {
    
    let days: Int

    var body: some View {

        Text(
            "OVERDUE BY \(days) " +
            (days == 1 ? "DAY" : "DAYS")
        )
        .font(
            .system(
                size: 8,
                weight: .bold
            )
        )
        .foregroundColor(.white)
        .padding(.horizontal, 7)
        .padding(.vertical, 4)
        .background(
            Capsule()
                .fill(Color.red)
        )
    }
}

//MARK: - ------------------------------------------------
//MARK: - AssignmentInstructionsView View
private struct AssignmentInstructionsView: View {

    let instructions: String

    var body: some View {

        VStack(
            alignment: .leading,
            spacing: 9
        ) {

            Text("Instructions")
                .font(
                    .system(
                        size: 13,
                        weight: .bold
                    )
                )

            Text(instructions)
                .font(.system(size: 12))
                .foregroundColor(.secondary)
                .lineSpacing(5)
        }
    }
}

//MARK: - ------------------------------------------------
//MARK: - AssignmentAttachmentView View
private struct AssignmentAttachmentView: View {

    let attachment: AssignmentAttachmentEntity
    var body: some View {

        VStack(
            alignment: .leading,
            spacing: 9
        ) {

            Text("Attachment")
                .font(
                    .system(
                        size: 13,
                        weight: .bold
                    )
                )

            HStack(spacing: 10) {

                AttachmentIcon(
                    type: attachment.fileType
                )

                VStack(
                    alignment: .leading,
                    spacing: 3
                ) {

                    Text(attachment.fileName)
                        .font(
                            .system(
                                size: 10,
                                weight: .semibold
                            )
                        )
                        .lineLimit(1)

                    Text(attachment.fileSize)
                        .font(.system(size: 9))
                        .foregroundColor(.secondary)
                }

                Spacer()

                Button("View") {
                    // Open attachment
                }
                .font(
                    .system(
                        size: 11,
                        weight: .semibold
                    )
                )
                .foregroundColor(.blue)
            }
            .padding(.horizontal, 12)
            .frame(height: 60)
            .background(Color.white)
            .clipShape(
                RoundedRectangle(cornerRadius: 10)
            )
        }
    }
}

//MARK: - ------------------------------------------------
//MARK: - AttachmentIcon View
private struct AttachmentIcon: View {

    let type: AttachmentFileTypeEnum

    var body: some View {

        ZStack {

            RoundedRectangle(cornerRadius: 7)
                .fill(
                    Color.red.opacity(0.10)
                )

            Image(systemName: iconName)
                .font(.system(size: 20))
                .foregroundColor(.secondary)
        }
        .frame(width: 38, height: 40)
    }

    private var iconName: String {
        switch type {
        case .pdf:
            return "doc.fill"
        case .image:
            return "photo.fill"
        case .document:
            return "doc.text.fill"
        }
    }
}

//MARK: - ------------------------------------------------
//MARK: - Teacher Contact View
private struct TeacherContactView: View {

    let teacherName: String
    let teacherRole: String
    let grade: String

    var body: some View {

        VStack(
            alignment: .leading,
            spacing: 9
        ) {

            Text("Teacher Contact")
                .font(
                    .system(
                        size: 13,
                        weight: .bold
                    )
                )

            HStack(spacing: 10) {

                TeacherAvatar(
                    name: teacherName
                )

                VStack(
                    alignment: .leading,
                    spacing: 3
                ) {

                    Text(teacherName)
                        .font(
                            .system(
                                size: 11,
                                weight: .bold
                            )
                        )

                    Text(
                        "\(teacherRole) · \(grade)"
                    )
                    .font(.system(size: 9))
                    .foregroundColor(.secondary)
                }

                Spacer()

                Button {
                    // Message teacher
                } label: {

                    Text("Message")
                        .font(
                            .system(
                                size: 10,
                                weight: .semibold
                            )
                        )
                        .foregroundColor(.white)
                        .padding(.horizontal, 12)
                        .frame(height: 26)
                        .background(
                            RoundedRectangle(
                                cornerRadius: 6
                            )
                            .fill(Color.blue)
                        )
                }
            }
            .padding(.horizontal, 12)
            .frame(height: 64)
            .background(Color.white)
            .clipShape(
                RoundedRectangle(cornerRadius: 10)
            )
        }
    }
}

//MARK: - ------------------------------------------------
//MARK: - TeacherAvatar View
private struct TeacherAvatar: View {

    let name: String

    var body: some View {

        Text(initials)
            .font(
                .system(
                    size: 12,
                    weight: .bold
                )
            )
            .foregroundColor(.white)
            .frame(width: 34, height: 34)
            .background(
                Circle()
                    .fill(Color.purple)
            )
    }

    private var initials: String {

        let components = name
            .split(separator: " ")
            .filter {
                !$0.hasSuffix(".")
            }

        return components
            .prefix(2)
            .compactMap { $0.first }
            .map(String.init)
            .joined()
    }
}

//MARK: - ------------------------------------------------
//MARK: - AssignmentCompletionView
private struct AssignmentCompletionView: View {

    @Binding var isCompleted: Bool

    var body: some View {

        VStack(spacing: 0) {

            Divider()

            Button {
                isCompleted.toggle()
            } label: {

                HStack(spacing: 8) {

                    RoundedRectangle(cornerRadius: 4)
                        .fill(
                            isCompleted
                            ? Color.green
                            : Color.white
                        )
                        .frame(
                            width: 18,
                            height: 18
                        )
                        .overlay {

                            RoundedRectangle(
                                cornerRadius: 4
                            )
                            .stroke(
                                isCompleted
                                ? Color.green
                                : Color(.systemGray4),
                                lineWidth: 0.8
                            )

                            if isCompleted {
                                Image(
                                    systemName: "checkmark"
                                )
                                .font(
                                    .system(
                                        size: 10,
                                        weight: .bold
                                    )
                                )
                                .foregroundColor(.white)
                            }
                        }

                    Text("Mark as Completed")
                        .font(
                            .system(
                                size: 11,
                                weight: .semibold
                            )
                        )
                        .foregroundColor(.secondary)

                    Spacer()
                }
                .padding(.horizontal, 17)
                .frame(height: 40)
            }
            .buttonStyle(.plain)
        }
        .background(Color.white)
    }
}

#Preview {
    AssignmentDetailView(assignment: .mock)
}
