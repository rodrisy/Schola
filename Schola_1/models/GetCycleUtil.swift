////
////  get_cycle_date.swift
////  Schola_1
////
////  Created by Rodrigo Sánchez Yuste on 12/4/24.
////
//
//import Foundation
//
//func calculateCycleDay(currentDate: Date, cycleDays: Int) -> Int {
//    let calendar = Calendar.current
//    var startDay = calendar.date(from: DateComponents(year: calendar.component(.year, from: currentDate), month: 1, day: 4))!
//    
//    while calendar.component(.weekday, from: startDay) != 2 {
//        startDay = calendar.date(byAdding: .day, value: 1, to: startDay)!
//    }
//    
//    var daysBetween = 0
//    var currentDate = currentDate
//    
//    while startDay < currentDate {
//        if !calendar.isDateInWeekend(startDay) {
//            let formattedStartDay = DateFormatter().string(from: startDay)
//            if !schedules[1].vacationDays.contains(formattedStartDay) {
//                daysBetween += 1
//            }
//        }
//        startDay = calendar.date(byAdding: .day, value: 1, to: startDay)!
//    }
//    
//    let cycleDay = daysBetween % cycleDays
//    return cycleDay == 0 ? cycleDays : cycleDay
//}
//
//func getUsername() -> String {
//    print("Enter your username: ", terminator: "")
//    return readLine() ?? ""
//}
//
//func ifUserExists(username: String) -> String {
//    // Assuming you have a function to check if the user exists
//    // and returning a message or something similar
//    return "Checking user existence for \(username)..."
//}
//
//// State how many days in a cycle
//let cycleDays = 6
//
//// State what day it is today
//let currentCycleDay = calculateCycleDay(currentDate: Date(), cycleDays: cycleDays)
//
//// Print the result
//print("Today is cycle day: \(currentCycleDay)")
//
//// What is this user
//let username = getUsername()
//print("You are signed in as: \(username)")
//
//// Check if user exists
//let doesUserExist = ifUserExists(username: username)
//print(doesUserExist)
