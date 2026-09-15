//
//  SplashView.swift
//  UnitPulse BH
//
//  Created by Mac-LAB on 9/15/26.
//

import SwiftUI

struct SplashView: View {
    
    @Binding var showSplash: Bool
    
    var body: some View {
        ZStack{
            
            LinearGradient(
                colors: [Color(.systemGray2), Color(.systemGray6), Color(.systemGray2)],
                    startPoint: .top,
                    endPoint: . bottom
            )
            
            .ignoresSafeArea()
            
            HStack {
                RoundedRectangle(cornerRadius: 60)
                    .fill(Color(.systemGray2).opacity(0.5))
                    .frame(width: 80, height: 220)
                
                Spacer()
                
                RoundedRectangle(cornerRadius: 60)
                    .fill(Color(.systemGray2).opacity(0.5))
                    .frame(width: 80, height: 220)
            }
            .padding(.horizontal, -20)
            
            VStack(spacing: 24) {
                Spacer()
            }
            
            VStack(spacing: 24) {
                Spacer()
                
                VStack(spacing: 4) {
                    Image(systemName: "house.fill")
                        .font(.system(size: 24))
                    
                    Text("Boarding House")
                        .font(.caption)
                        .foregroundColor(.gray)
                    
                    Text("UnitPULSE")
                        .font(.system(size: 28, weight: .bold))
                }
                .padding(.vertical, 24)
                .padding(.horizontal, 40)
                .background(Color(.systemGray6)
                    .cornerRadius(30))
            }
            
            Image("HOUSE")
                .resizable()
                .scaledToFill()
                .frame(width: 40, height: 40)
                .padding(20)
            
            Button {
                withAnimation {
                    showSplash = false
                }
            } label: {
                Image("HOUSE")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 120, height: 40)
                    .padding(20)
            }
            
            Spacer()
            }
        }
    }


#Preview {
    SplashView(showSplash: .constant(true))
}
