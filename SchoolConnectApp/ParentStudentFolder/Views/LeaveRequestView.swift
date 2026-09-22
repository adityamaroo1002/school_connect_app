//
//  LeaveRequestView.swift
//  SchoolConnectApp
//
//  Created by Aditya Maroo on 16/09/2026.
//


import SwiftUI
import PhotosUI

struct LeaveRequestView: View {

    @State private var selectedImage: UIImage?
    @State private var selectedPhotoItem: PhotosPickerItem?

    var body: some View {
        setup
    }
}

//MARK: - ------------------------------------------------
//MARK: - View Component Extension
private extension LeaveRequestView{
    
    var setup: some View{
        VStack(spacing: 0) {

            // Keep your existing header here
            // LeaveRequestHeader()

            ScrollView {
                VStack(alignment: .leading, spacing: 16) {

                    // MARK: - Start Date
                    TextFieldComponent(
                        .constant("Sep 9, 2026"),
                        label: "Start Date",
                        placeHolder: "Select start date"
                    )

                    // MARK: - End Date
                    TextFieldComponent(
                        .constant("Sep 10, 2026"),
                        label: "End Date",
                        placeHolder: "Select end date"
                    )

                    // MARK: - Reason
                    LeaveRequestTextEditor(
                        title: "Reason for Leave",
                        placeholder: "Enter reason for leave",
                        text: .constant("Family function out of town.")
                    )

                    // MARK: - Supporting Document
                    SupportingDocumentView(
                        selectedImage: $selectedImage,
                        selectedPhotoItem: $selectedPhotoItem
                    )
                }
                .padding(20)
            }

            ButtonColorFullSize(label: "Submit Request") {
                
            }
            .padding(20)
        }
        .background(Color(.systemGroupedBackground))
    }
}

#Preview {
    LeaveRequestView()
}
