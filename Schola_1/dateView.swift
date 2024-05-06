import SwiftUI

struct ContentView3: View {
    @State private var currentDate = Date()
    @State private var number = 0
    @State private var backgroundColor = Color.green
    let rainbowColors: [Color] = [.red, .orange, .yellow, .green, .blue, .purple]
    let schedules = dwightschedules.first(where: { $0.scheduleName == "11grade" })
    
    let username: String

    var body: some View {
        NavigationView {
            ZStack {
                backgroundColor.edgesIgnoringSafeArea(.all)
                VStack {
                    // page index
                    Text("\(number)")
                        .font(.system(size: 100, weight: .bold, design: .default))
                        .foregroundColor(.white)
                        .padding()
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
                    
                    let userSchedule = dwightSchedule.first { $0.students.contains { $0.username == username } }
                    
                    if let userSchedule = userSchedule{
                       let classesForDay = userSchedule.students.first?.cycle[indexDay].schedule {
                        ForEach(classesForDay, id: \.self) { classObj in
                            Text("\(classObj.name) - \(classObj.teacher)")
                        }
                    } else {
                        Text("No classes found")
                    }
                    
                    if let schedules = schedules {
                        let dayIndex = indexDay - 1
                        if dayIndex < schedules.days.count {
                            
                            let selectedDay = schedules.days[dayIndex]
                            
                            let colorIndex = dayIndex % self.rainbowColors.count
                            
                            VStack(alignment: .leading, spacing: 5) {
                                Text(selectedDay.dayName)
                                    .font(.subheadline)
                                    .foregroundColor(.white)
                                    .padding(5)
                                    .background(self.rainbowColors[colorIndex])
                                    .cornerRadius(5)
                                
                                ForEach(selectedDay.blocks, id: \.letter) { block in
                                    // Display block details
                                    HStack {
                                        Text("\(block.letter): \(block.startTime) - \(block.endTime)")
                                        Spacer()
                                    }
                                    .padding(5)
                                    .background(self.rainbowColors[colorIndex])
                                    .cornerRadius(5)
                                    .foregroundColor(.white)
                                }
                            }
                        }
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

