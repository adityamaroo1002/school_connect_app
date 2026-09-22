//
//  ContentView.swift
//  SchoolConnectApp
//
//  Created by Aditya Maroo on 09/09/2026.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        setup
    }
}

private extension SplashView{
     var setup: some View{
        ZStack {
            Color.blue
                .ignoresSafeArea()
            logo
        }
    }
    
    var logo: some View{
        VStack(spacing: 16){
            Image(.logoFull120)
            Text("School Connect")
                .font(.system(size: 24, weight: .bold))
                .foregroundStyle(.white)
            Text("Bridging Schools & Families")
                .font(.system(size: 16, weight: .medium))
                .foregroundStyle(.white)
        }
    }
}
    
//MARK: - ------------------------------------------------
//MARK: - Preview
#Preview {
    SplashView()
}
