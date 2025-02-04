//
//  CustomeCalendarView.swift
//  MyClinicTime
//
//  Created by Dor Mizrachi on 29/01/2025.
//

import SwiftUI

struct CustomeCalendarView: View {
    @Environment(UserViewModel.self) var userviewModel
    
    @Binding var date: Date
    @Binding var selectedDate: Date?
    
    @State private var color: Color = .blue
    @State private var days: [Date] = []
    
    let daysOfWeek = Date.capitalizedFirstLettersOfWeekdays
    let columns = Array(repeating: GridItem(.flexible()), count: 7)
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    date = Calendar.current.date(byAdding: .month, value: -1, to: date) ?? date
                
                }) {
                    Image(systemName: "arrow.backward")
                        .font(.system(size: 18, weight: .bold))
                }
                Spacer()
                
                VStack(alignment: .center) {
                    Text(date.formatted(.dateTime.month(.wide)))
                    Text(date.formatted(.dateTime.year(.defaultDigits)))
                }
                .font(.system(size: 18, weight: .bold))
                .onTapGesture {
                    selectedDate = nil
                }
                
                Spacer()
                Button(action: {
                    date = Calendar.current.date(byAdding: .month, value: 1, to: date) ?? date
               
                }) {
                    Image(systemName: "arrow.forward")
                        .font(.system(size: 18, weight: .bold))
                }
            }
            .padding()
            
            // Apply the offset to the calendar view
            HStack {
                ForEach(daysOfWeek.indices, id: \.self) { index in
                    Text(daysOfWeek[index])
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity)
                }
            }
            
            LazyVGrid(columns: columns) {
                ForEach(days, id: \.self) { day in
                    if day.monthInt != date.monthInt {
                        Text("")
                    } else {
                        VStack {
                            Text(day.formatted(.dateTime.day()))
                                .fontWeight(.bold)
                                .foregroundStyle(.secondary)
                                .transition(.scale)
                                
                            // Add a circle if there are appointments for the day
//                            if hasAppointment {
//                                Circle()
//                                    .fill(Color.blue)
//                                    .frame(width: 8)
//                            }
                            
                            Spacer()
                        }
                        .frame(maxWidth: .infinity, minHeight: 40)
                        .padding(.vertical, 5)
                        .background(
                            RoundedRectangle(cornerRadius: 5)
                                .foregroundStyle(backgroundColor(day))
                        )
                        .onTapGesture {
                            selectedDate = day.startOfDay
                            print("\(String(describing: selectedDate))")
                        }
                    }
                }
            }
        }
        .padding()
        .onAppear {
            days = date.calendarDisplayDays
        }
        .onChange(of: date) {
            days = date.calendarDisplayDays
        }
    }
    
    func backgroundColor(_ day: Date) -> Color {
        if selectedDate == day.startOfDay {
            return .green.opacity(0.3)
        } else if Date.now.startOfDay == day.startOfDay {
            return .red.opacity(0.3)
        }
        return color.opacity(0.3)
    }
}

#Preview {
    @Previewable @State var selectedDate: Date? = nil
    @Previewable @State var date = Date.now
    let user = UserViewModel().allUsers.first!
    CustomeCalendarView(date: $date, selectedDate: $selectedDate)
        .environment(UserViewModel())
        .environment(AppointmentViewModel())
}
