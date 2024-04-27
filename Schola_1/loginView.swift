import SwiftUI
import UIKit

struct LoginView: View {
    
    @State private var backgroundColor = Color(UIColor.systemGray5) // Change the background color here
    @State private var username = ""
    
    var body: some View {
        ZStack {
            backgroundColor.edgesIgnoringSafeArea(.all)
            VStack {
                // welcome title
                Text("welcome to Schola")
                    .font(.system(size: 56, weight: .bold, design: .default))
                    .padding()
                // instructions
                Text("enter your school email here. without the domain though.")
                    .font(.system(size: 24, weight: .semibold, design: .default))
                // text input
                TextField("2025rsanchez", text: $username)
                    .background(Color.black.opacity(0.5))
                    .disableAutocorrection(true)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                // submit button
                NavigationLink(destination: ContentView3()) {
                    Text("next bish")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .buttonStyle(BorderlessButtonStyle()) // Apply ButtonStyle
                .padding()
                .onTapGesture {
                    print("Button tapped!")
                    validateUsername(username: username) // Call the validation function
                }
            }
        }
    }
    
    private func validateUsername(username: String) {
        print("Validation: \(username)")
        // Add your validation logic here
    }
}

#Preview{
    LoginView()
}
