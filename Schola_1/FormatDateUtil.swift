import Foundation

func calculateCycleDay(currentDate: Date, cycleDays: Int, vacationDays: [String]) -> Int {
    var startDay = Calendar.current.date(from: DateComponents(year: Calendar.current.component(.year, from: currentDate), month: 1, day: 4))!
    
    while Calendar.current.component(.weekday, from: startDay) != 2 { // Monday
        startDay = Calendar.current.date(byAdding: .day, value: 1, to: startDay)!
    }
    
    var daysBetween = 0
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyyMMdd"
    var formattedStartDay = dateFormatter.string(from: startDay)
    
    while startDay < currentDate {
        if !Calendar.current.isDateInWeekend(startDay) && !vacationDays.contains(formattedStartDay) {
            daysBetween += 1
        }
        startDay = Calendar.current.date(byAdding: .day, value: 1, to: startDay)!
        formattedStartDay = dateFormatter.string(from: startDay)
    }
    
    let cycleDay = daysBetween % cycleDays
    return cycleDay == 0 ? cycleDays : cycleDay
}
