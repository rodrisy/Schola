import SwiftUI

struct ContentView3: View {
    @State private var currentDate = Date()
    @State private var number = 0
    @State private var backgroundColor = Color.green
    let rainbowColors: [Color] = [.red, .orange, .yellow, .green, .blue, .purple]
//    let schedules = dwightschedules.first(where: { $0.scheduleName == "11grade" })
    
    
    let username: String

    // Find the userSchedule
        var userSchedule: Student? {
            // Iterate through the dwightSchedule to find the matching student
            for schedule in dwightSchedule {
                if let student = schedule.students.first(where: { $0.username == username }) {
                    return student
                }
            }
            return nil
        }
    
    var body: some View {
        NavigationView {
            ZStack {
                backgroundColor.edgesIgnoringSafeArea(.all)
                VStack {
                    // page index
//                    Text("\(number)")
//                        .font(.system(size: 100, weight: .bold, design: .default))
//                        .foregroundColor(.white)
//                        .padding()
                    // current day MMM dd yyyy
                    Text("\(formattedDate(date: currentDate))")
                        .font(.title)
                        .foregroundColor(.white)
                        .padding()
                    // current day EEEE
                    Text("\(formattedWeekday(date: currentDate))")
                        .font(.title)
                        .foregroundColor(.white)
                        .padding()
                    // dayIndex
                    let indexDay = calculateCycleDay(currentDate: currentDate, cycleDays: 6, vacationDays: [])
                    Text("\(calculateCycleDay(currentDate: currentDate, cycleDays: 6, vacationDays: []))")
                        .font(.system(size: 100, weight: .bold, design: .default))
                        .foregroundColor(.white)
                        .padding()
                    
                    if let userSchedule = userSchedule {
                        Text("User Schedule:")
                            .font(.title)
                            .padding()
                        
                        // Display the user schedule details
                        ForEach(userSchedule.cycle[indexDay-1].schedule, id: \.name) { classInfo in
                            let randomColor = rainbowColors.randomElement()
                            ZStack {
                                randomColor
                                    .cornerRadius(8)
                                Text("\(classInfo.name) - \(classInfo.teacher)")
                                    .font(.subheadline)
                                    .foregroundColor(.white)
                                    .padding()
                            }
                        }
                    } else {
                        Text("User Schedule not found.")
                            .font(.title)
                            .padding()
                    }
                    
                }
            }
            .gesture(
                DragGesture()
                    .onEnded { value in
                        if value.translation.width < 0 {
                            // Swipe to the right
                            self.changeValue(increase: true)
                        } else {
                            // Swipe to the left
                            self.changeValue(increase: false)
                        }
                    }
            )
        }}

    private func changeValue(increase: Bool) {
        if increase {
            number += 1
            currentDate = Calendar.current.date(byAdding: .day, value: 1, to: currentDate) ?? Date()
        } else {
            number -= 1
            currentDate = Calendar.current.date(byAdding: .day, value: -1, to: currentDate) ?? Date()
        }

        backgroundColor = number % 2 == 0 ? Color.green : Color.blue // Change color based on number
    }

    private func formattedDate(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd, yyyy"
        return dateFormatter.string(from: date)
    }

    private func formattedWeekday(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: date)
    }
}

