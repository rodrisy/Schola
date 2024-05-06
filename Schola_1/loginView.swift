import SwiftUI
import UIKit

struct LoginView: View {
    
    @State private var backgroundColor = Color(UIColor.systemGray5) // Change the background color here
    @State private var username = ""
    @State private var wrongUsername = 0
    @State private var showingLoginScreen = false
    
    var body: some View {
        NavigationView{
            ZStack {
                Color.blue
                    .ignoresSafeArea()
                Circle()
                    .scale(1.7)
                    .foregroundColor(.white.opacity(0.15))
                Circle ()
                    .scale (1.35)
                    .foregroundColor(.white)
                // open vstack
                VStack{
                    Image("schola_elephant copy").frame(width: 0.5, height: 0.5).cornerRadius(25)
                    Text("Login")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    TextField("2025rsanchez", text: $username )
                        .padding()
                        .frame(width: 300, height: 50)
                        .background (Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .border(.red.opacity(0.5), width: CGFloat(wrongUsername))
//                    SecureField("enter 1234", text: $password )
//                        .padding()
//                        .frame(width: 300, height: 50)
//                        .background (Color.black.opacity(0.05))
//                        .cornerRadius(10)
//                        .border(.red.opacity(0.5), width: CGFloat(wrongPassword))
                    Button(action: {
                        // authenticate the user
                        authenticateUser(username: username)
                    }) {
                        Text("login")
                            .foregroundColor(.white)
                            .frame(width: 300, height: 50) // Adjust button frame to cover the entire area
                            .background(Color.blue)
                            .cornerRadius(10)
                            .padding() // Add padding around the button
                    }
                    //navlink to other screen
                    NavigationLink(
                        destination: ContentView3(username: username),
                                isActive: $showingLoginScreen,
                                label: {}
                            )
                }// close Vstack
            }// close Ztack
            .navigationBarHidden(true)
        }// close navview
        
    }// close body
    func authenticateUser(username: String) {
        // Loop through the schedules in the database
        for Schedule in dwightSchedule {
            // Loop through the students in each schedule
            for Student in Schedule.students {
                // Check if the username matches any student's username
                if Student.username == username.lowercased() {
                    // Username found, authentication successful
                    wrongUsername = 0
                    showingLoginScreen = true
                    
                } else {
                    // Username not found, authentication failed
                    wrongUsername = 2
                    showingLoginScreen = false
                }
            }
        }
    }
    
}// close loginView


//ZStack {
//    backgroundColor.edgesIgnoringSafeArea(.all)
//    VStack {
//        // welcome title
//        Text("welcome to Schola")
//            .font(.system(size: 56, weight: .bold, design: .default))
//            .padding()
//        // instructions
//        Text("enter your school email here. without the domain though.")
//            .font(.system(size: 24, weight: .semibold, design: .default))
//        // text input
//        TextField("2025rsanchez", text: $username)
//            .background(Color.black.opacity(0.5))
//            .disableAutocorrection(true)
//            .textFieldStyle(RoundedBorderTextFieldStyle())
//            .padding()
//        
//        // submit button
//        NavigationLink(destination: ContentView3()) {
//            Text("next bish")
//                .padding()
//                .background(Color.blue)
//                .foregroundColor(.white)
//                .cornerRadius(8)
//        }
//        .buttonStyle(BorderlessButtonStyle()) // Apply ButtonStyle
//        .padding()
//        .onTapGesture {
//            print("Button tapped!")
//            validateUsername(username: username) // Call the validation function
//        }
//    }
//}

#Preview {
    LoginView()
}
