//
//  SplashScreenView.swift
//  Schola_1
//
//  Created by Rodrigo Sánchez Yuste on 16/7/24.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    var body: some View {
        VStack{
            VStack{
                Image("schola_elephant copy")
                            .resizable()
                            .frame(width: 200, height: 200) // Adjust the width and height as needed
                Spacer().frame(height: 0)
                Text("Schola")
            }
        }
    }
}

#Preview {
    SplashScreenView()
}
