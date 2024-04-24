import SwiftUI

struct DateView: View {
    @State private var currentDate = Date()

    var body: some View {
        VStack {
            Text(dayOfWeek(date: currentDate))
                .font(.title)
                .padding()
            Text("\(formattedDate(date: currentDate))")
                .font(.title)
                .padding()
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
        .gesture(
            DragGesture()
                .onEnded { value in
                    if value.translation.width < 0 {
                        // Swiped right, navigate to the next day
                        self.currentDate = Calendar.current.date(byAdding: .day, value: 1, to: self.currentDate) ?? Date()
                    } else {
                        // Swiped left, navigate to the previous day
                        self.currentDate = Calendar.current.date(byAdding: .day, value: -1, to: self.currentDate) ?? Date()
                    }
                }
        )
    }

    func formattedDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM dd, yyyy"
        return formatter.string(from: date)
    }

    func dayOfWeek(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE"
        return formatter.string(from: date)
    }
}

struct DateView1: View {
    var body: some View {
        DateView()
    }
}


#Preview {
    DateView1()
}
