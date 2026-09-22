//
//  SupportingDocumentView.swift
//  SchoolConnectApp
//
//  Created by Aditya Maroo on 16/09/2026.
//


import SwiftUI
import PhotosUI

struct SupportingDocumentView: View {

    @Binding var selectedImage: UIImage?
    @Binding var selectedPhotoItem: PhotosPickerItem?

    var body: some View {

        VStack(alignment: .leading, spacing: 6) {

            Text("Supporting Document (Optional)")
                .font(.system(size: 11, weight: .semibold))
                .foregroundColor(.secondary)

            PhotosPicker(
                selection: $selectedPhotoItem,
                matching: .images,
                photoLibrary: .shared()
            ) {

                uploadContent
            }
            .onChange(of: selectedPhotoItem) { newItem in

                guard let newItem else {
                    return
                }

                Task {
                    if let data = try? await newItem.loadTransferable(
                        type: Data.self
                    ) {
                        selectedImage = UIImage(data: data)
                    }
                }
            }
        }
    }

    @ViewBuilder
    private var uploadContent: some View {

        if let selectedImage {

            ZStack(alignment: .topTrailing) {

                Image(uiImage: selectedImage)
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity)
                    .frame(height: 95)
                    .clipShape(
                        RoundedRectangle(cornerRadius: 8)
                    )

                Image(systemName: "arrow.triangle.2.circlepath")
                    .font(.system(size: 13, weight: .semibold))
                    .foregroundColor(.white)
                    .padding(8)
                    .background(Color.black.opacity(0.55))
                    .clipShape(Circle())
                    .padding(8)
            }
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(
                        Color(.systemGray4),
                        lineWidth: 0.8
                    )
            )

        } else {

            VStack(spacing: 8) {

                Image(systemName: "paperclip")
                    .font(.system(size: 25))
                    .foregroundColor(.gray)

                Text("Tap to upload")
                    .font(.system(size: 12, weight: .medium))
                    .foregroundColor(.secondary)

                Text("PDF, JPEG, PNG — Max 10 MB")
                    .font(.system(size: 9))
                    .foregroundColor(.gray)
            }
            .frame(maxWidth: .infinity)
            .frame(height: 94)
            .background(Color.white)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(
                        Color(.systemGray4),
                        style: StrokeStyle(
                            lineWidth: 1,
                            dash: [4, 4]
                        )
                    )
            )
            .clipShape(
                RoundedRectangle(cornerRadius: 8)
            )
        }
    }
}
