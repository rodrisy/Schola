import SwiftUI

struct ContentView3: View {
    @State private var currentDate = Date()
    @State private var number = 0
    //@State private var backgroundColor = Color.black
    
    let rainbowColors: [Color] = [.red, .orange, .yellow, .green, .mint, .teal, .cyan, .blue, .indigo, .purple, .pink, .brown]
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
                //backgroundColor.edgesIgnoringSafeArea(.all)
                VStack {
                    // page index
//                    Text("\(number)")
//                        .font(.system(size: 100, weight: .bold, design: .default))
//                        .foregroundColor(.white)
//                        .padding()
                    // current day MMM dd yyyy
            
                    HStack(alignment: .bottom, content: {
                        Text("\(formattedWeekday(date: currentDate))")
                            .font(.system(size: 34, weight: .bold))
                        Spacer()
                        Text("\(formattedDate(date: currentDate))")
                            .font(.system(size: 19, weight: .semibold))
                    })
                    

                    let indexDay = calculateCycleDay(currentDate: currentDate, cycleDays: 6, vacationDays: [])
//                    Text("\(calculateCycleDay(currentDate: currentDate, cycleDays: 6, vacationDays: []))")
//                        .font(.system(size: 100, weight: .bold, design: .default))
//                        .foregroundColor(.white)
//                        .padding()
                    if Calendar.current.isDateInWeekend(currentDate){
                        Spacer()
                        Text("no school today,")
                            .font(.system(size: 32, weight: .bold))
                       //     .foregroundColor(.white)
                        Text("get to studying!")
                            .font(.system(size: 24, weight: .semibold))
                      //      .foregroundColor(.white)
                        Spacer()
                    } else {
                        
                        if let userSchedule = userSchedule {
                            // Display the user schedule details
                            // Scroll thing
                            ScrollView{
                                ForEach(Array(userSchedule.cycle[indexDay-1].schedule.enumerated()), id: \.element.name) { index, classInfo in
                                    let randomColor = rainbowColors.randomElement()
                                    let (startTime, endTime) = calculateClassTimes(for: index)
                                    
                                    ZStack {
                                        randomColor
                                            .cornerRadius(8)
                                        HStack(
                                            content: {
                                                VStack(alignment: .leading, content: {
                                                    Text("\(classInfo.name)")
                                                        .font(.headline)
                                                        .foregroundColor(.white)
                                                    if classInfo.teacher != "N/A" {
                                                        Text("\(classInfo.teacher)")
                                                            .font(.subheadline)
                                                            .foregroundColor(.white)
                                                    }
                                                })
                                                Spacer()
                                                VStack( alignment: .trailing,
                                                        content: {
                                                    Text("\(startTime)")
                                                    Text("\(endTime)")
                                                })
                                            })
                                        .padding(EdgeInsets(top: 0,leading: 16, bottom: 0, trailing: 16))
                                    }
                                    .frame(width: 360, height: 80)
                                    .swipeActions(edge: .trailing) {
                                        Button(role: .destructive) {
                                            // Action for deleting the item
                                        } label: {
                                            Label("Delete", systemImage: "trash")
                                        }
                                        Button {
                                            // Another action, e.g., editing the item
                                        } label: {
                                            Label("Edit", systemImage: "pencil")
                                        }
                                        .tint(.blue)}
                                }
                            }
                            } else {
                            Text("User Schedule not found.")
                                .font(.title)
                                .padding()
                        }
                        Spacer()
                    }
                    
                }
                .padding(16)
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
    
    // get times for the boxes
    func calculateClassTimes(for index: Int) -> (String, String) {
            let startHour = 8 // 8 AM
            let startTime = startHour + index // Each class starts 1 hour after the previous one
            let endTime = startTime + (55 / 60) // End time is 55 minutes after start time

            let startHourFormatted = startTime % 12 == 0 ? 12 : startTime % 12 // Adjust for 12-hour format
            let startPeriod = startTime < 12 || startTime == 24 ? "AM" : "PM" // Determine AM/PM
            
            let endHourFormatted = endTime % 12 == 0 ? 12 : endTime % 12 // Adjust for 12-hour format
            let endPeriod = endTime < 12 || endTime == 24 ? "AM" : "PM" // Determine AM/PM

            let startTimeString = String(format: "%d:00 %@", startHourFormatted, startPeriod)
            let endTimeString = String(format: "%d:55 %@", endHourFormatted, endPeriod)

            return (startTimeString, endTimeString)
        }
    
    // change screen as swipe
    private func changeValue(increase: Bool) {
        if increase {
            number += 1
            currentDate = Calendar.current.date(byAdding: .day, value: 1, to: currentDate) ?? Date()
        } else {
            number -= 1
            currentDate = Calendar.current.date(byAdding: .day, value: -1, to: currentDate) ?? Date()
        }

        /*backgroundColor = number % 2 == 0 ? Color.green : Color.blue*/ // Change color based on number
        // dont chaneg color
        //backgroundColor = Color.black
    }

    // format day to may 23, 2024
    private func formattedDate(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd, yyyy"
        return dateFormatter.string(from: date)
    }

    // format day to thursday
    private func formattedWeekday(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: date)
    }
}


#Preview {
    ContentView3(username: "2025rsanchez")

}

