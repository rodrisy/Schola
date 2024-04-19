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

struct ContentView: View {
    let schedule = Schedule()
    @State private var currentDayIndex = 0
    @State private var currentDay = getToday()
    
    var body: some View {
        TabView(selection: $currentDay) {
            ForEach(Day.allCases, id: \.self) { day in
                VStack {
                    Text("Selected Date: \(day.stringValue)")
                        .font(.title)
                        .padding()
                    
                    Text("Date: \(formatDate(Date()))")
                        .font(.title)
                        .padding()
                    
                    Text("Today's Classes")
                        .font(.title)
                        .padding()
                    
                    let classes = schedule.getClasses(for: day)
                    
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
                .tag(day)
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
        .gesture(
            DragGesture()
                .onEnded { gesture in
                    if gesture.translation.width > 0 {
                        withAnimation {
                            self.currentDayIndex = (self.currentDayIndex + 1) % Day.allCases.count
                            self.currentDay = Day.allCases[self.currentDayIndex]
                        }
                    } else {
                        withAnimation {
                            self.currentDayIndex = (self.currentDayIndex - 1 + Day.allCases.count) % Day.allCases.count
                            self.currentDay = Day.allCases[self.currentDayIndex]
                        }
                    }
                }
        )
    }
    
    
    func formatDate(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "EEEE, d MMMM"
        let dateString = dateFormatter.string(from: date)
        return dateString
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
