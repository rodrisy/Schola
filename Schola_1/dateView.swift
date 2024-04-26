import SwiftUI

struct ContentView3: View {
    @State private var currentDate = Date()
    @State private var number = 0
    @State private var backgroundColor = Color.green

    var body: some View {
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
                Text("\(calculateCycleDay(currentDate: currentDate, cycleDays: 6, vacationDays: []))")
                    .font(.system(size: 100, weight: .bold, design: .default))
                    .foregroundColor(.white)
                    .padding()
                
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
    }

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

struct ContentView3_Previews: PreviewProvider {
    static var previews: some View {
        ContentView3()
    }
}
