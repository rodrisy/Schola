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
    @State private var opacity = 0.0
    
    var body: some View {
        
        if isActive {
            LoginView()
        } else {
        // // //
            VStack{
                VStack{
                    Image("schola_elephant copy")
                                .resizable()
                                .frame(width: 150, height: 150) // Adjust the width and height as needed
                    Spacer().frame(height: 0)
                    Text("Schola").font(.largeTitle.bold()).foregroundColor(.black)
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear{
                    withAnimation(.easeIn(duration: 1.2)) {
                        self.size = 0.9
                        self.opacity = 1.0
                    }
                }
            }.onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    self.isActive = true
                }
            }.background(.white).frame(maxWidth: .infinity, maxHeight: .infinity)
        // // //
        }
    }
}

#Preview {
    SplashScreenView()
}
