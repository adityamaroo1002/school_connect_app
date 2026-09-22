//
//  SchoolCalendarView.swift
//  SchoolConnectApp
//
//  Created by Aditya Maroo on 21/09/2026.
//


import SwiftUI

struct SchoolCalendarView: View {
    
    let events: [CalendarEvent]
    let attendanceAlert: AttendanceAlert?
    
    @State private var selectedDate = Date()
    @State private var displayedMonth = Date()
    
    var body: some View {
        setup
    }
}

//MARK: - ------------------------------------------------
//MARK: - View Component Extension
private extension SchoolCalendarView{
    
    var setup: some View{
        VStack(spacing: 0) {
            
            // Keep your existing app header here
            CalendarTopHeaderView()
            
            ScrollView(
                showsIndicators: false
            ) {
                
                VStack(
                    alignment: .leading,
                    spacing: 12
                ) {
                    
                    MonthSelectorView(
                        month: displayedMonth,
                        onPrevious: {
                            changeMonth(by: -1)
                        },
                        onNext: {
                            changeMonth(by: 1)
                        }
                    )
                    
                    CalendarGridView(
                        month: displayedMonth,
                        selectedDate: $selectedDate
                    )
                    
                    CalendarLegendView()
                    
                    TodaySection(
                        date: selectedDate,
                        alert: attendanceAlert
                    )
                    
                    UpcomingEventsSection(
                        events: events
                    )
                }
                .padding(.horizontal, 12)
                .padding(.top, 10)
                .padding(.bottom, 20)
            }
            
            // Keep your existing bottom tab bar
            // BottomTabBar()
        }
        .background(
            Color(.systemGroupedBackground)
        )
    }
    
    private func changeMonth(by value: Int) {
        
        guard let newMonth = Calendar.current.date(
            byAdding: .month,
            value: value,
            to: displayedMonth
        ) else {
            return
        }
        
        displayedMonth = newMonth
    }
}

private struct CalendarTopHeaderView: View {

    var body: some View {

        HStack {

            Text("Calendar")
                .font(
                    .system(
                        size: 16,
                        weight: .bold
                    )
                )

            Spacer()

            Image(systemName: "calendar")
                .font(
                    .system(
                        size: 17,
                        weight: .medium
                    )
                )
                .foregroundColor(.secondary)
        }
        .padding(.horizontal, 20)
        .frame(height: 56)
        .background(Color(.systemBackground))
        .overlay(
            Divider(),
            alignment: .bottom
        )
    }
}

private struct MonthSelectorView: View {

    let month: Date
    let onPrevious: () -> Void
    let onNext: () -> Void

    private var monthTitle: String {

        month.formatted(
            .dateTime
                .month(.wide)
                .year()
        )
    }

    var body: some View {

        HStack {

            Button {
                onPrevious()
            } label: {

                Image(
                    systemName: "chevron.left"
                )
                .font(
                    .system(
                        size: 11,
                        weight: .bold
                    )
                )
            }

            Spacer()

            Text(monthTitle)
                .font(
                    .system(
                        size: 13,
                        weight: .bold
                    )
                )

            Spacer()

            Button {
                onNext()
            } label: {

                Image(
                    systemName: "chevron.right"
                )
                .font(
                    .system(
                        size: 11,
                        weight: .bold
                    )
                )
            }
        }
        .foregroundColor(.primary)
        .padding(.horizontal, 4)
    }
}


private struct CalendarLegendView: View {

    var body: some View {

        HStack(spacing: 8) {

            LegendItem(
                title: "Attendance",
                color: .green
            )

            LegendItem(
                title: "Homework",
                color: .orange
            )

            LegendItem(
                title: "Holiday",
                color: .red
            )

            LegendItem(
                title: "Event",
                color: .purple
            )
        }
        .font(.system(size: 8))
    }
}

private struct LegendItem: View {

    let title: String
    let color: Color

    var body: some View {

        HStack(spacing: 3) {

            Circle()
                .fill(color)
                .frame(
                    width: 6,
                    height: 6
                )

            Text(title)
                .foregroundColor(.secondary)
        }
    }
}

private struct TodaySection: View {

    let date: Date
    let alert: AttendanceAlert?

    var body: some View {

        VStack(
            alignment: .leading,
            spacing: 8
        ) {

            Text("\(date.formatted(.dateTime.month(.abbreviated).day())) — Today")
            .font(
                .system(
                    size: 13,
                    weight: .bold
                )
            )

            if let alert {

                AttendanceAlertCard(
                    alert: alert
                )
            }
        }
    }
}

private struct UpcomingEventsSection: View {

    let events: [CalendarEvent]

    var body: some View {

        VStack(
            alignment: .leading,
            spacing: 8
        ) {

            Text("Upcoming Events")
                .font(
                    .system(
                        size: 13,
                        weight: .bold
                    )
                )

            LazyVStack(spacing: 8) {

                ForEach(events) { event in

                    CalendarEventCard(
                        event: event
                    )
                }
            }
        }
    }
}

#Preview {
    SchoolCalendarView(
          events: CalendarMockData.events,
          attendanceAlert:
              CalendarMockData.attendanceAlert
      )
}
