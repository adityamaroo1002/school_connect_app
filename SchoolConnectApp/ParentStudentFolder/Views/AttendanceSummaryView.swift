//
//  AttendanceSummaryView.swift
//  SchoolConnectApp
//
//  Created by Aditya Maroo on 16/09/2026.
//

import SwiftUI

struct AttendanceSummaryOveviewView: View {
    var body: some View {
        setup
    }
}

private extension AttendanceSummaryOveviewView{
    
    var setup: some View{
        VStack(spacing: 0) {
            
            // Keep your existing header here
            // AttendanceHeader()
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: 20) {
                    
                    MonthSelectorView(
                        month: .constant("September 2026")
                    )
                    
                    AttendanceSummaryView(
                        present: .constant(18),
                        absent: .constant(2),
                        late: .constant(1)
                    )
                    
                    AttendanceChartView(present: 20, absent: 5, late: 3)
                    
                    AttendanceHistoryView(
                        records: .constant([
                            AttendanceRecordEntity(
                                date: "Sep 8, Mon",
                                status: .absent
                            ),
                            AttendanceRecordEntity(
                                date: "Sep 5, Fri",
                                status: .present
                            ),
                            AttendanceRecordEntity(
                                date: "Sep 4, Thu",
                                status: .late
                            ),
                            AttendanceRecordEntity(
                                date: "Sep 3, Wed",
                                status: .absent
                            ),
                            AttendanceRecordEntity(
                                date: "Sep 2, Tue",
                                status: .present
                            )
                        ])
                    )
                }
                .padding(20)
               
            }
            
            // Keep your existing floating button
            // AttendanceAddButton()
        }
        .background(Color(.systemGroupedBackground))
    }
}

//MARK: - ------------------------------------------------
//MARK: - Month Selector View
private struct MonthSelectorView: View {
    
    @Binding var month: String
    
    var body: some View {
        HStack(spacing: 16){
            
            Button {
                // Previous month
            } label: {
                Image(systemName: "triangle.fill")
                    .font(.system(size: 10))
                    .rotationEffect(.degrees(-90))
                    .foregroundColor(.primary)
            }

            Text(month)
                .font(.system(size: 18, weight: .semibold))
                .foregroundColor(.primary)
            
            Button {
                // Next month
            } label: {
                Image(systemName: "triangle.fill")
                    .font(.system(size: 10))
                    .rotationEffect(.degrees(90))
                    .foregroundColor(.primary)
            }
        }
        .frame(height: 25)
    }
}

//MARK: - ------------------------------------------------
//MARK: - Attendance Summary View
private struct AttendanceSummaryView: View {

    @Binding var present: Int
    @Binding var absent: Int
    @Binding var late: Int

    var body: some View {
        HStack(spacing: 10) {

            AttendanceStatCard(
                count: present,
                title: "PRESENT",
                color: Color.green
            )

            AttendanceStatCard(
                count: absent,
                title: "ABSENT",
                color: Color.red
            )

            AttendanceStatCard(
                count: late,
                title: "LATE",
                color: Color.orange
            )
        }
    }
}

//MARK: - ------------------------------------------------
//MARK: - Attendance Chart View
private struct AttendanceChartView: View {
    
    let present: Int
    let absent: Int
    let late: Int

    private var total: Int {
        present + absent + late
    }

    var attendancePercentage: Int {
        guard total > 0 else { return 0 }
        return Int(
            (Double(present) / Double(total)) * 100
        )
    }

    var body: some View {
        ZStack {

            Circle()
                .stroke(
                    Color.yellow.opacity(0.4),
                    lineWidth: 19
                )
                .frame(width: 120, height: 120)

            Circle()
                .trim(
                    from: 0,
                    to: CGFloat(present) / CGFloat(max(total, 1))
                )
                .stroke(
                    Color.green,
                    lineWidth: 19
                )
                .frame(width: 120, height: 120)
                .rotationEffect(.degrees(-90))
            
            Circle()
                .trim(
                    from: CGFloat(present) / CGFloat(max(total, 1)),
                    to: CGFloat(present) / CGFloat(max(total, 1)) + (CGFloat(absent) / CGFloat(max(total, 1)))
                )
                .stroke(
                    Color.red,
                    lineWidth: 19
                )
                .frame(width: 120, height: 120)
                .rotationEffect(.degrees(-90))

            VStack(spacing: 0) {

                Text("\(attendancePercentage)%")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.green)

                Text("Attendance")
                    .font(.system(size: 8))
                    .foregroundColor(.secondary)
            }
        }
        .frame(width: 145, height: 145)
    }
}

//MARK: - ------------------------------------------------
//MARK: - Attendance HistoryView View
private struct AttendanceHistoryView: View {
    
    @Binding var records: [AttendanceRecordEntity]

    var body: some View {
        VStack(alignment: .leading, spacing: 9) {

            Text("This Month")
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(.primary)

            LazyVStack(spacing: 9) {

                ForEach(records) { record in
                    AttendanceRowView(record: record)
                }
            }
        }
    }
}



#Preview {
    AttendanceSummaryOveviewView()
}
