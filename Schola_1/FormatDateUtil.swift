//
//  format_date.swift
//  Schola_1
//
//  Created by Rodrigo Sánchez Yuste on 12/4/24.
//

import Foundation

func calculateCurrentDay(today: Date, dayDifference: Int) -> Date {
    var currentDate = Calendar.current.date(byAdding: .day, value: dayDifference, to: today)!
    
    while Calendar.current.component(.weekday, from: currentDate) > 5 {
        // If it's Saturday or Sunday, add days to make it Monday
        currentDate = Calendar.current.date(byAdding: .day, value: 8 - Calendar.current.component(.weekday, from: currentDate), to: currentDate)!
    }
    return currentDate
}

func formatDateEEEEddMMMMyyyy(date: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "EEEE dd 'of' MMMM yyyy"
    return formatter.string(from: date)
}

func formatDateEEEE(date: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "EEEE"
    return formatter.string(from: date)
}

func formatDateMMMMDD(date: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "MMMM dd"
    return formatter.string(from: date)
}

func calculateCycleDay(currentDate: Date, cycleDays: Int, schedules: [Schedule]) -> Int {
    let calendar = Calendar.current
    var startDay = calendar.date(from: DateComponents(year: calendar.component(.year, from: currentDate), month: 1, day: 4))!

    while calendar.component(.weekday, from: startDay) != 2 {
        startDay = calendar.date(byAdding: .day, value: 1, to: startDay)!
    }

    var daysBetween = 0
    var currentDate = currentDate

    while startDay < currentDate {
        if !calendar.isDateInWeekend(startDay) {
            let formattedStartDay = DateFormatter().string(from: startDay)
            for schedule in schedules {
                            if !schedule.vacationDays.contains(formattedStartDay) {
                                daysBetween += 1
                            }
                        }
        }
        startDay = calendar.date(byAdding: .day, value: 1, to: startDay)!
    }

    let cycleDay = daysBetween % cycleDays
    return cycleDay == 0 ? cycleDays : cycleDay
}
