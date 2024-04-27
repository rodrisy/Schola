import SwiftUI
import Foundation

var dayDifference = 0

enum Day: Int, CaseIterable {
    case sunday = 1, monday, tuesday, wednesday, thursday, friday, saturday
    
    func previous() -> Day {
        let allDays = Day.allCases
        let index = allDays.firstIndex(of: self)!
        let previousIndex = (index + allDays.count - 1) % allDays.count
        dayDifference -= 1
        return allDays[previousIndex]
    }
    
    func next() -> Day {
        let allDays = Day.allCases
        let index = allDays.firstIndex(of: self)!
        let nextIndex = (index + 1) % allDays.count
        dayDifference += 1
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
    let vacationDays: [String]  // Array to store vacation days as strings

        init(vacationDays: [String] = []) { // Default value of empty array for vacationDays
            self.subjects = [
                .sunday: [],
                .monday: [.chem, .computerScience, .econ],
                .tuesday: [.english, .spanish, .chem],
                .wednesday: [.philosophy, .art, .physics],
                .thursday: [.computerScience, .econ, .english],
                .friday: [.spanish, .chem, .philosophy],
                .saturday: []
            ]
            self.vacationDays = vacationDays
        }
    
    func getClasses(for day: Day) -> [Subject] {
        guard let classes = subjects[day] else { return [] }
        return classes
    }
}

func getToday() -> Date {
    return Date()
}

struct ContentView: View {
    let schedule = Schedule()
    @State private var selectedDate = Date()
    @State private var formattedDate = ""
    
    init() {
        let initialDate = calculateCurrentDay(today: getToday(), dayDifference: 0)
        self._selectedDate = State(initialValue: initialDate)
        self._formattedDate = State(initialValue: formatDate(initialDate))
    }
    
    var body: some View {
        TabView() {
            ForEach(Day.allCases, id: \.self) { day in
                VStack {
                    Text("Selected Date: \(day.stringValue)")
                        .font(.title)
                        .padding()
                    
                    // Use formattedDate instead of formatting selectedDate directly
                    Text("Date: \(formattedDate)")
                        .font(.title)
                        .padding()
                    
                    
                    // Other views...
                }
                .tag(day)
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
        .gesture(
            DragGesture()
                .onEnded { gesture in
                    let translation = gesture.translation.width
                    if translation > 0 {
                        // Swipe right, go to previous day
                        selectedDate = Calendar.current.date(byAdding: .day, value: -1, to: selectedDate) ?? selectedDate
                    } else {
                        // Swipe left, go to next day
                        selectedDate = Calendar.current.date(byAdding: .day, value: 1, to: selectedDate) ?? selectedDate
                    }
                    formattedDate = formatDate(selectedDate) // Update formatted date
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
    
    func calculateCurrentDay(today: Date, dayDifference: Int) -> Date {
        return Calendar.current.date(byAdding: .day, value: dayDifference, to: today) ?? today
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



#Preview {
    ContentView()
}
