//
//  CustomeCalendarView.swift
//  MyClinicTime
//
//  Created by Dor Mizrachi on 29/01/2025.
//

import SwiftUI

struct CustomeCalendarView: View {
    @EnvironmentObject var data: UserViewModel
    
    @Binding var date: Date
    @Binding var selectedDate: Date?
    
    @State private var color: Color = .blue
    @State private var days: [Date] = []
    
    let daysOfWeek = Date.capitalizedFirstLettersOfWeekdays
    let columns = Array(repeating: GridItem(.flexible()), count: 7)
    
    var body: some View {
        VStack {
            DatePicker("Select Month", selection: $date,  displayedComponents: [.date])
                
            HStack {
                ForEach(daysOfWeek.indices, id: \.self) { index in
                Text(daysOfWeek[index])
                        .fontWeight(.black)
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
            .swipeActions(edge: .trailing) {
                
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
    let user = User(firstName: "firstname", lastName: "lastName", dateOfBirth: Date.now, email: "email@gmail.com", password: "password")
    CustomeCalendarView(date: $date, selectedDate: $selectedDate)
        .environmentObject(UserViewModel(user: user))
}
