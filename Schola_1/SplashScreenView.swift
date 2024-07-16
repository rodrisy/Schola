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
                Image(uiImage: UIImage(named: "schola_elephant copy") ?? UIImage()).font(.system(size:0.5))
                Text("Schola")
            }
        }
    }
}

#Preview {
    SplashScreenView()
}
