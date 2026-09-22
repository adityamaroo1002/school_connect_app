//
//  Link.swift
//  SchoolConnectApp
//
//  Created by Aditya Maroo on 09/09/2026.
//

import SwiftUI

struct InviteCodeView: View {
    @State private var otpCode: String = ""
    
    var body: some View {
        setup
    }
}

//MARK: - Extension for Configure and setup componets
private extension InviteCodeView{
    var setup: some View{
        VStack(spacing: 24){
            lockChainText
            header
            OtpCodeView(code: $otpCode, onComplete: {_ in })
            loginBtn
            footer
        }
        .padding(20)
    }
    
    var lockChainText: some View{
        Text("🔗")
            .font(.system(size: 60))
    }
    
    var header: some View{
        VStack(spacing: 16){
            Text("Link Your Child")
                .font(.system(size: 24, weight: .bold))
                .foregroundStyle(.black)
            Text("Enter the invite code provided by your school")
                .font(.system(size: 16, weight: .medium))
                .foregroundStyle(.black)
        }
    }
    
    var loginBtn: some View{
        ButtonColorFullSize(label: "Link Child") {
            
        }
    }
    
    var footer: some View{
        Text("I don't have a code")
            .font(.system(size: 16, weight: .medium))
            .foregroundStyle(.blue)
    }
}

fileprivate struct OtpCodeView: View {
    
    /// Number of digits in the code.
    let length: Int
    /// Called every time the code becomes complete (exactly `length` digits).
    var onComplete: (String) -> Void
    
    /// Bind this from the parent if you want external control (e.g. clearing
    /// the code after a failed verification). Defaults to internal state.
    @Binding var code: String
    
    /// Disables input, e.g. while a verification request is in flight.
    var isDisabled: Bool = false
    /// Shows an error state (red boxes) e.g. after a failed verification.
    var isError: Bool = false
    
    @FocusState private var isFocused: Bool
    @State private var hasFiredCompletion = false
    
    init(
        length: Int = 6,
        code: Binding<String>,
        isDisabled: Bool = false,
        isError: Bool = false,
        onComplete: @escaping (String) -> Void
    ) {
        self.length = length
        self._code = code
        self.isDisabled = isDisabled
        self.isError = isError
        self.onComplete = onComplete
    }
    
    var body: some View {
        ZStack{
            textField
            otpBox
        }
        .onAppear {
            // Defensive: if `code` was pre-populated (e.g. deep link / paste
            // from outside), make sure it's still valid on first render.
            sanitize(code)
        }
        
    }
    
    private var textField: some View{
        TextField("", text: $code)
            .keyboardType(.numberPad)
            .textContentType(.oneTimeCode)   // enables SMS code autofill
            .disableAutocorrection(true)
            .focused($isFocused)
            .disabled(isDisabled)
            .opacity(0.001) // invisible, but still hit-testable & focusable
            .accessibilityLabel("One-time passcode")
            .accessibilityValue(code)
            .onChange(of: code) { newValue in
                sanitize(newValue)
            }
        // Some iOS versions briefly show a caret even at near-zero
        // opacity; this keeps it fully non-interactive as a decoy.
            .frame(width: 1, height: 1)
            .allowsHitTesting(false)
        
    }
    
    private var otpBox: some View{
        // Visual boxes
        HStack(spacing: 12) {
            ForEach(0..<length, id: \.self) { index in
                boxView(for: index)
            }
        }
        .contentShape(Rectangle())
        .onTapGesture {
            if !isDisabled { isFocused = true }
        }
        
    }
    
    
    @ViewBuilder
    private func boxView(for index: Int) -> some View {
        let characters = Array(code)
        let hasChar = index < characters.count
        let isNextEmptySlot = index == characters.count && isFocused
        
        RoundedRectangle(cornerRadius: 10)
            .strokeBorder(borderColor(hasChar: hasChar, isCursorSlot: isNextEmptySlot), lineWidth: isNextEmptySlot ? 2 : 1.5)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color(.secondarySystemBackground))
            )
            .frame(width: 46, height: 54)
            .overlay(
                Group {
                    if hasChar {
                        Text(String(characters[index]))
                            .font(.title2)
                            .fontWeight(.semibold)
                            .monospacedDigit()
                            .foregroundColor(.primary)
                            .transition(.opacity)
                    } else if isNextEmptySlot {
                        BlinkingCursor()
                    }
                }
            )
            .animation(.easeOut(duration: 0.12), value: code)
    }
    
    private func borderColor(hasChar: Bool, isCursorSlot: Bool) -> Color {
        if isError { return .red }
        if isCursorSlot { return .accentColor }
        if hasChar { return Color(.systemGray3) }
        return Color(.systemGray4)
    }
    
    // MARK: - Core sanitation logic (handles almost every edge case)
    
    private func sanitize(_ newValue: String) {
        // 1. Strip everything that isn't a digit (handles pasted strings
        //    like "123-456", "12 34 56", emoji, letters, etc.)
        let digitsOnly = newValue.filter(\.isNumber)
        
        // 2. Clamp to max length (handles pasting a longer string than
        //    the code length, e.g. a 10-digit paste).
        let clamped = String(digitsOnly.prefix(length))
        
        // 3. Only write back if it actually changed, to avoid an infinite
        //    onChange loop and unnecessary view updates.
        if clamped != code {
            code = clamped
        }
        
        // 4. Fire completion exactly once when the code becomes full,
        //    and re-arm once the user starts editing again.
        if code.count == length {
            if !hasFiredCompletion {
                hasFiredCompletion = true
                isFocused = false // dismiss keyboard on completion (optional UX choice)
                onComplete(code)
            }
        } else {
            hasFiredCompletion = false
        }
    }
    
    /// Call this to programmatically clear the code (e.g. after a failed
    /// verification) and refocus the field for re-entry.
    func clear() {
        code = ""
        hasFiredCompletion = false
        isFocused = true
    }
}

private struct BlinkingCursor: View {
    @State private var visible = true
    
    var body: some View {
        Rectangle()
            .fill(Color.accentColor)
            .frame(width: 2, height: 26)
            .opacity(visible ? 1 : 0)
            .onAppear {
                withAnimation(.easeInOut(duration: 0.6).repeatForever(autoreverses: true)) {
                    visible.toggle()
                }
            }
    }
}



//MARK: - Preview
#Preview {
    InviteCodeView()
}
