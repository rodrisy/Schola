import SwiftUI
import Foundation

enum Day: Int, CaseIterable {
    case sunday = 1, monday, tuesday, wednesday, thursday, friday, saturday
    
    func previous() -> Day {
        let allDays = Day.allCases
        let index = allDays.firstIndex(of: self)!
        let previousIndex = (index + allDays.count - 1) % allDays.count
        return allDays[previousIndex]
    }
    
    func next() -> Day {
        let allDays = Day.allCases
        let index = allDays.firstIndex(of: self)!
        let nextIndex = (index + 1) % allDays.count
        return allDays[nextIndex]
    }
    
    var stringValue: String {
        switch self {
        case .sunday: return "Sunday"
        case .monday: return "Monday"
        case .tuesday: return "Tuesday"
        case .wednesday: return "Wednesday"
        case .thursday: return "Thursday"
        case .friday: return "Friday"
        case .saturday: return "Saturday"
        }
    }
}

enum Subject: String {
    case chem = "Chemistry"
    case computerScience = "Computer Science"
    case econ = "Economics"
    case english = "English"
    case spanish = "Spanish"
    case philosophy = "Philosophy"
    case art = "Art"
    case physics = "Physics"
}

struct Schedule {
    let subjects: [Day: [Subject]]
    
    init() {
        self.subjects = [
            .sunday: [],
            .monday: [.chem, .computerScience, .econ],
            .tuesday: [.english, .spanish, .chem],
            .wednesday: [.philosophy, .art, .physics],
            .thursday: [.computerScience, .econ, .english],
            .friday: [.spanish, .chem, .philosophy],
            .saturday: []
        ]
    }
    
    func getClasses(for day: Day) -> [Subject] {
        guard let classes = subjects[day] else { return [] }
        return classes
    }
}

func getToday() -> Day {
    let calendar = Calendar.current
    let today = calendar.component(.weekday, from: Date())
    return Day(rawValue: today)!
}

func formatDate(_ date: Date) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.locale = Locale(identifier: "en_US_POSIX")
    dateFormatter.dateFormat = "EEEE, MMMM d"
    let dateString = dateFormatter.string(from: date)
    let day = Calendar.current.component(.day, from: date)
    let suffix: String
    switch day {
    case 1, 21, 31: suffix = "st"
    case 2, 22: suffix = "nd"
    case 3, 23: suffix = "rd"
    default: suffix = "th"
    }
    return "\(dateString)\(suffix)"
}

struct ContentView: View {
    let schedule = Schedule()
    @State private var currentDay = getToday()
    
    var body: some View {
        VStack {
            Text("Date: \(formatDate(Date()))")
                .font(.title)
                .padding()
            
            Text("Today's Classes")
                .font(.title)
                .padding()
            
            let classes = schedule.getClasses(for: currentDay)
            
            if classes.isEmpty {
                Text("No classes today!")
                    .padding()
            } else {
                ForEach(classes, id: \.self) { subject in
                    Text(subject.rawValue)
                        .padding()
                }
            }
        }
        .gesture(
            DragGesture()
                .onEnded { gesture in
                    if gesture.translation.width > 0 {
                        self.currentDay = self.currentDay.previous()
                    } else {
                        self.currentDay = self.currentDay.next()
                    }
                }
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
