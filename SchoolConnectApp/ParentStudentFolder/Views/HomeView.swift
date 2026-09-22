//
//  HomeView.swift
//  SchoolConnectApp
//
//  Created by Aditya Maroo on 15/09/2026.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        setup
    }
}

//MARK: - ------------------------------------------------
//MARK: - View Component Extension
private extension HomeView{
    var setup: some View{
        VStack(alignment: .leading,spacing: 16){
            title
            feedList
        }
        .padding(20)
        .background(Color(.systemGroupedBackground))
    }
    
    var title: some View{
        Text("Today's Updates")
            .font(.system(size: 18, weight: .bold))
            .foregroundStyle(.black)
    }
    
    var feedList: some View{
        ScrollView{
            LazyVStack(spacing: 10){
                ForEach(FeedEntity.mockData()){data in
                    FeedCard(data: data)
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
