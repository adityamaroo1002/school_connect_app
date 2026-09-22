//
//  CalendarEventCard.swift
//  SchoolConnectApp
//
//  Created by Aditya Maroo on 21/09/2026.
//


import SwiftUI
 struct CalendarEventCard: View {

    let event: CalendarEvent

    var body: some View {

        HStack(spacing: 10) {

            RoundedRectangle(
                cornerRadius: 2
            )
            .fill(event.type.color)
            .frame(
                width: 3,
                height: 32
            )

            VStack(
                alignment: .leading,
                spacing: 3
            ) {

                Text(event.title)
                    .font(
                        .system(
                            size: 10,
                            weight: .semibold
                        )
                    )
                    .foregroundColor(.primary)

                HStack(spacing: 3) {

                    Text(
                        event.date.formatted(
                            .dateTime
                                .month(.abbreviated)
                                .day()
                        )
                    )

                    if let time = event.time {

                        Text("·")

                        Text(time)
                    }

                    if let location = event.location {

                        Text("·")

                        Text(location)
                    }
                }
                .font(.system(size: 8))
                .foregroundColor(.secondary)
            }

            Spacer()
        }
        .padding(.horizontal, 12)
        .frame(minHeight: 52)
        .background(Color.white)
        .clipShape(
            RoundedRectangle(
                cornerRadius: 10
            )
        )
    }
}


enum CalendarMockData {

    static let attendanceAlert = AttendanceAlert(
        title: "Aarav marked Absent",
        subtitle: "Attendance Alert",
        type: .absent
    )

    static let events: [CalendarEvent] = [

        CalendarEvent(
            title: "Parent-Teacher Meeting",
            date: makeDate(
                month: 9,
                day: 20
            ),
            time: "3:00 PM – 5:00 PM",
            type: .event
        ),

        CalendarEvent(
            title: "Annual Day Celebration",
            date: makeDate(
                month: 10,
                day: 15
            ),
            location: "School Auditorium",
            type: .holiday
        )
    ]

    private static func makeDate(
        month: Int,
        day: Int
    ) -> Date {

        Calendar.current.date(
            from: DateComponents(
                year: 2026,
                month: month,
                day: day
            )
        ) ?? Date()
    }
}
