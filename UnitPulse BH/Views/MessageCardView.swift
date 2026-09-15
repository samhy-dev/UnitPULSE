//
//  MessageCardView.swift
//  UnitPulse BH
//
//  Created by Mac-LAB on 9/8/26.
//

import SwiftUI

struct MessageCardView: View {
    
    let message: Message
    
    var body: some View {
        HStack(alignment: .top) {
            Image(systemName: "envelope.fill")
                .padding(.top, 4)
            
            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Text(message.recipientName)
                        .fontWeight(.semibold)
                    Spacer()
                    Text("Email")
                        .font(.caption2)
                        .foregroundColor(.gray)
                }
                Text(message.dateSent)
                    .font(.caption2)
                    .foregroundColor(.gray)
                Text(message.content)
                    .font(.caption)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 2)
    }
}

