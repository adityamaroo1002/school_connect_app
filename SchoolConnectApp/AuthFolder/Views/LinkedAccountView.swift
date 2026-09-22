//
//  LinkedAccountView.swift
//  SchoolConnectApp
//
//  Created by Aditya Maroo on 15/09/2026.
//

import SwiftUI

struct LinkedAccountView: View {
    var body: some View {
        setup
    }
}

//MARK: - ------------------------------------------------
//MARK: - View Component Extension
private extension LinkedAccountView{
    
    private var setup: some View{
        ZStack{
            Color.gray.opacity(0.2).ignoresSafeArea()
            contentFit
        }
    }
    
    private var contentFit: some View{
        ViewThatFits {
            content
            ScrollView{
                content
            }
            .padding(.top, 1)
        }
    }
    
    var content: some View{
        VStack(spacing: 24){
            checkTick
            linkAccLabel
            linkAccountList
            btnStack
        }
        .padding(20)
    }
    
    private var checkTick: some View{
        Image(.checkTick)
            .resizable()
            .frame(width: 100, height: 100)
            .clipShape(Circle())
    }
    
    private var linkAccLabel: some View{
        Text("Linked Successfully !")
            .font(.system(size: 20, weight: .bold))
            .foregroundStyle(.green)
    }
    
    private var linkAccountList: some View{
        LazyVStack(spacing: 10){
            ForEach(LinkAccountEntity.mockData()){data in
                LinkAccountCard(data: data)
            }
        }
    }
    
    var btnStack: some View{
        VStack(spacing: 10){
            continueHome
            addAnotherAcc
        }
    }
    
    var continueHome: some View{
        ButtonColorFullSize(label: "Continue to Home") {
            
        }
    }
    
    var addAnotherAcc: some View{
        ButtonStrokeFullSize(label: "+ Add Another Child") {
            
        }
    }
}

#Preview {
    LinkedAccountView()
}
