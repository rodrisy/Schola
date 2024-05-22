import Foundation

func calculateCycleDay(currentDate: Date, cycleDays: Int, vacationDays: [String]) -> Int {
    var startDay = Calendar.current.date(from: DateComponents(year: Calendar.current.component(.year, from: currentDate), month: 3, day: 15))!
    
    while Calendar.current.component(.weekday, from: startDay) != 2 { // Monday
        startDay = Calendar.current.date(byAdding: .day, value: 1, to: startDay)!
    }
    
    var daysBetween = 0
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyyMMdd"
    var formattedStartDay = dateFormatter.string(from: startDay)
    // hare calculates days between the start of the course to today (excluding weekends and vacations)
    while startDay < currentDate {
        // here the algorithm decides to skip any vacation days in the database when choosing the date
        if !Calendar.current.isDateInWeekend(startDay) && !vacationDays.contains(formattedStartDay) {
            daysBetween += 1
        }
        startDay = Calendar.current.date(byAdding: .day, value: 1, to: startDay)!
        formattedStartDay = dateFormatter.string(from: startDay)
    }
    // here the algorithm gets the remainders when dividing to get the current cycle day
    let cycleDay = daysBetween % cycleDays
    return cycleDay == 0 ? cycleDays : cycleDay
}
