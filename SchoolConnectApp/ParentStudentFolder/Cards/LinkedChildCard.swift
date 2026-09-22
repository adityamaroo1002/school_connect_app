//
//  LinkedChildCard.swift
//  SchoolConnectApp
//
//  Created by Aditya Maroo on 18/09/2026.
//
import SwiftUI

 struct LinkedChildCard: View {

     let child: LinkedChildEntity

    var body: some View {

        HStack(spacing: 10) {

            Text(child.initial)
                .font(
                    .system(
                        size: 13,
                        weight: .bold
                    )
                )
                .foregroundColor(.white)
                .frame(
                    width: 34,
                    height: 34
                )
                .background(
                    Circle()
                        .fill(Color.blue)
                )

            VStack(
                alignment: .leading,
                spacing: 3
            ) {

                Text(child.name)
                    .font(
                        .system(
                            size: 11,
                            weight: .semibold
                        )
                    )

                Text(
                    "\(child.grade) · " +
                    "\(child.section) · " +
                    "Roll #\(child.rollNumber)"
                )
                .font(.system(size: 9))
                .foregroundColor(.secondary)
            }

            Spacer()
        }
        .padding(.horizontal, 12)
        .frame(height: 53)
        .background(Color.white)
        .clipShape(
            RoundedRectangle(
                cornerRadius: 10
            )
        )
    }
}
