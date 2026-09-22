//
//  TextField.swift
//  SchoolConnectApp
//
//  Created by Aditya Maroo on 15/09/2026.
//

import SwiftUI

struct TextFieldComponent: View {
    @Binding private var text: String
    private let label: String
    private let placeHolder: String
    
    init(_ text: Binding<String>, label: String, placeHolder: String = "") {
        self._text = text
        self.label = label
        self.placeHolder = placeHolder
    }
    
    var body: some View {
        VStack(alignment: .leading){
            Text(label)
                .font(.system(size: 14, weight: .regular))
                .foregroundStyle(.black)
            TextField(placeHolder, text: $text, prompt: Text(placeHolder))
                .padding(14)
                .background{
                    RoundedRectangle(cornerRadius: 12).fill(.white)
                }
                .overlay{
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color(.systemGray4))
                }
        }
    }
}
