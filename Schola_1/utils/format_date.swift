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
