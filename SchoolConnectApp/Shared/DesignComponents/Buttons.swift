//
//  Buttons.swift
//  SchoolConnectApp
//
//  Created by Aditya Maroo on 15/09/2026.
//

import SwiftUI

struct ButtonColorFullSize: View{
    let label: String
    let action: ()-> Void
    var color: Color = .blue
    
    var body: some View{
        Button(action: {}){
            Text(label)
                .font(.system(size: 16, weight: .bold))
                .foregroundStyle(.white)
                .padding(16)
                .frame(maxWidth: .infinity)
                .background{
                    RoundedRectangle(cornerRadius: 12)
                        .fill(color)
                }
        }
    }
}

struct ButtonStrokeFullSize: View{
    let label: String
    let action: ()-> Void
    var color: Color = .blue
    
    var body: some View{
        Button(action: {}){
            Text(label)
                .font(.system(size: 16, weight: .bold))
                .foregroundStyle(color)
                .padding(16)
                .frame(maxWidth: .infinity)
                .background{
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(color)
                }
        }
    }
}
