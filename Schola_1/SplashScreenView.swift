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
                            .frame(width: 100, height: 100) // Adjust the width and height as needed
                Spacer().frame(height: 0)
                Text("Schola").font(.largeTitle.bold())
            }
            .scaleEffect(size)
            .opacity(opacity)
            .onAppear{
                withAnimation(.easeIn(duration: 1.2)) {
                    self.size = 0.9
                    self.opacity = 1.0
                }
            }
        }
    }
}

#Preview {
    SplashScreenView()
}
