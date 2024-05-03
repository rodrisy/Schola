import SwiftUI
import UIKit

struct LoginView: View {
    
    @State private var backgroundColor = Color(UIColor.systemGray5) // Change the background color here
    @State private var username = ""
    @State private var password = ""
    @State private var wrongUsername = 0
    @State private var wrongPassword = 0
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
                    TextField("Username", text: $username )
                        .padding()
                        .frame(width: 300, height: 50)
                        .background (Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .border(.red.opacity(0.5), width: CGFloat(wrongUsername))
                    SecureField("Password", text: $password )
                        .padding()
                        .frame(width: 300, height: 50)
                        .background (Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .border(.red.opacity(0.5), width: CGFloat(wrongPassword))
                    Button(action: {
                        // authenticate the user
                        authenticateUser(username: username, password: password)
                    }) {
                        Text("login")
                            .foregroundColor(.white)
                            .frame(width: 300, height: 50) // Adjust button frame to cover the entire area
                            .background(Color.blue)
                            .cornerRadius(10)
                            .padding() // Add padding around the button
                    }
                    //navlink to other screen
                    .navigationDestination(
                         isPresented: $showingLoginScreen) {
                              ContentView3()
                         }
                }// close Vstack
            }// close Ztack
            .navigationBarHidden(true)
        }// close navview
        
    }// close body
    func authenticateUser(username: String, password: String) {
        if username.lowercased() == "2025rsanchez" {
            wrongUsername = 0
            if password == "1234"{
                wrongPassword = 0
                showingLoginScreen = true
            }else{
                wrongPassword = 3
            }
        }else{
            wrongUsername = 3
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
