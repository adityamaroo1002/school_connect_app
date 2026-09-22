//
//  CalendarGridView.swift
//  SchoolConnectApp
//
//  Created by Aditya Maroo on 21/09/2026.
//


import SwiftUI

struct CalendarGridView: View {
    
    let month: Date
    
    @Binding var selectedDate: Date
    
    private let columns = Array(
        repeating: GridItem(.flexible()),
        count: 7
    )
    
    private let weekdays = [
        "Sun",
        "Mon",
        "Tue",
        "Wed",
        "Thu",
        "Fri",
        "Sat"
    ]
    
    var body: some View {
        
        VStack(spacing: 8) {
            
            HStack {
                
                ForEach(
                    weekdays,
                    id: \.self
                ) { day in
                    
                    Text(day)
                        .font(
                            .system(size: 8)
                        )
                        .foregroundColor(.secondary)
                        .frame(
                            maxWidth: .infinity
                        )
                }
            }
            
            LazyVGrid(
                columns: columns,
                spacing: 8
            ) {
                
                ForEach(
                    makeCalendarDays(),
                    id: \.id
                ) { day in
                    
                    CalendarDayCell(
                        day: day,
                        isSelected: Calendar.current.isDate(
                            day.date,
                            inSameDayAs: selectedDate
                        )
                    ) {
                        selectedDate = day.date
                    }
                }
            }
        }
    }
    
    private func makeCalendarDays() -> [CalendarDay] {
        
        let calendar = Calendar.current
        
        guard let monthInterval = calendar.dateInterval(
            of: .month,
            for: month
        ) else {
            return []
        }
        
        let firstWeekday = calendar.component(
            .weekday,
            from: monthInterval.start
        )
        
        let numberOfDays = calendar.range(
            of: .day,
            in: .month,
            for: month
        )?.count ?? 0
        
        var result: [CalendarDay] = []
        
        // Empty cells before first day
        for _ in 1..<(firstWeekday) {
            
            let emptyDate = Date()
            
            result.append(
                CalendarDay(
                    date: emptyDate,
                    isCurrentMonth: false,
                    isToday: false
                )
            )
        }
        
        for day in 1...numberOfDays {
            
            guard let date = calendar.date(
                bySetting: .day,
                value: day,
                of: month
            ) else {
                continue
            }
            
            result.append(
                CalendarDay(
                    date: date,
                    isCurrentMonth: true,
                    isToday: calendar.isDateInToday(date),
                    
                    // Mock indicators for now
                    attendance: day == 2 || day == 3,
                    homework: day == 5 || day == 12,
                    holiday: false,
                    event: day == 20
                )
            )
        }
        
        return result
    }
}

private struct CalendarDayCell: View {

    let day: CalendarDay
    let isSelected: Bool
    let action: () -> Void

    var body: some View {

        Button {
            guard day.isCurrentMonth else {
                return
            }

            action()
        } label: {

            VStack(spacing: 3) {

                Text(day.isCurrentMonth ? "\(Calendar.current.component(.day,from: day.date))" : "")
                .font(
                    .system(
                        size: 10,
                        weight: isSelected
                            ? .bold
                            : .regular
                    )
                )
                .foregroundColor(
                    isSelected
                    ? .white
                    : .primary
                )

                HStack(spacing: 2) {

                    if day.attendance {
                        IndicatorDot(color: .green)
                    }

                    if day.homework {
                        IndicatorDot(color: .orange)
                    }

                    if day.holiday {
                        IndicatorDot(color: .red)
                    }

                    if day.event {
                        IndicatorDot(color: .purple)
                    }
                }
                .frame(height: 4)
            }
            .frame(
                width: 38,
                height: 34
            )
            .background(
                Group {
                    if isSelected {

                        Circle()
                            .fill(Color.blue)
                    }
                }
            )
        }
        .buttonStyle(.plain)
    }
}

private struct IndicatorDot: View {

    let color: Color

    var body: some View {

        Circle()
            .fill(color)
            .frame(
                width: 3.5,
                height: 3.5
            )
    }
}
