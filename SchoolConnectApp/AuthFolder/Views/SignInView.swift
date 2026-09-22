//
//  SignInView.swift
//  SchoolConnectApp
//
//  Created by Aditya Maroo on 09/09/2026.
//

import SwiftUI

struct SignInView: View {
    var body: some View {
        setup
    }
}

//MARK: - ------------------------------------------------
//MARK: - View Component Extension
private extension SignInView{
    
    var setup: some View{
        VStack(spacing: 24){
            imageLogo
            header
            form
            footer
            Spacer()
        }
        .padding(20)
        .padding(.top, 24)
    }
    
    var imageLogo: some View{
        Image(.logoFull120)
            .resizable()
            .frame(width: 60, height: 60)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    var header: some View{
        VStack(alignment: .leading, spacing: 10){
            Text("Welcome Back")
                .font(.system(size: 24, weight: .bold))
                .foregroundStyle(.black)
            Text("Sign in to your School Connect account")
                .font(.system(size: 16, weight: .medium))
                .foregroundStyle(.black)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    var form: some View{
        VStack(alignment: .trailing, spacing: 16){
            TextFieldComponent(.constant(""), label: "Email Address", placeHolder: "parent@school.com")
            TextFieldComponent(.constant(""), label: "Password", placeHolder: "Enter you password")
            forgotBtn
            loginBtn
        }
    }
    
    var forgotBtn: some View{
        Button(action: {}){
            Text("Forgot Password?")
                .font(.system(size: 16, weight: .medium))
                .foregroundStyle(.blue)
        }
    }
    
    var loginBtn: some View{
        ButtonColorFullSize(label: "Log In"){
            
        }
    }
    
    var footer: some View{
        VStack(spacing: 5){
            Text("Don't have an account?")
                .font(.system(size: 16, weight: .medium))
                .foregroundStyle(.black)
            Text("Contact your school admin")
                .font(.system(size: 16, weight: .medium))
                .foregroundStyle(.blue)
        }
    }
    
}

#Preview {
    SignInView()
}
