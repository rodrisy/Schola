//import SwiftUI
//
//struct ContentView: View {
//    @State private var isLoggedIn: Bool = false
//
//    var body: some View {
//        VStack {
//            if isLoggedIn {
//                DwightScheduleScreenRepresentable()
//            } else {
//                LoginPage(isLoggedIn: $isLoggedIn)
//            }
//        }
//    }
//}
//
//struct LoginPage: View {
//    @Binding var isLoggedIn: Bool
//    @State private var enteredID: String = ""
//
//    var body: some View {
//        NavigationView {
//            Form {
//                Section {
//                    TextField("Enter Student ID", text: $enteredID)
//                        .textContentType(.username)
//                }
//                Section {
//                    Button(action: {
//                        submitButtonTapped()
//                    }) {
//                        Text("Submit")
//                    }
//                }
//            }
//            .navigationTitle("Student ID")
//        }
//    }
//
//    func submitButtonTapped() {
//        // You can add validation logic here
//        isLoggedIn = true
//    }
//}
//
//struct DwightScheduleScreenRepresentable: UIViewControllerRepresentable {
//    func makeUIViewController(context: Context) -> DwightScheduleScreen {
//        return DwightScheduleScreen()
//    }
//
//    func updateUIViewController(_ uiViewController: DwightScheduleScreen, context: Context) {
//        // Optional: Update the view controller if needed
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
