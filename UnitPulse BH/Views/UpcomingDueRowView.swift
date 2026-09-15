//
//  UpcomingDueRowView.swift
//  UnitPulse BH
//
//  Created by Mac-LAB on 9/4/26.
//


import SwiftUI

struct UpcomingDueRowView: View {
    
    let due: UpcomingDue
    
    var body: some View {
        HStack(alignment: .top) {
            Image(systemName: "person.fill")
                .padding(.top, 4)
            
            VStack(alignment: .leading, spacing: 2) {
                Text(due.tenantName)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                Text("MONTHLY")
                    .font(.caption2)
                    .foregroundColor(.gray)
                Text(due.roomName)
                    .font(.caption2)
                    .foregroundColor(.gray)
                Text("Last Paid \(due.lastPaidDate)")
                    .font(.caption2)
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            VStack(alignment: .trailing, spacing: 2) {
                Text("₱\(Int(due.amount))")
                    .font(.subheadline)
                    .fontWeight(.bold)
                if due.isOverdue {
                    Text(due.overdueText)
                        .font(.caption2)
                        .fontWeight(.semibold)
                        .foregroundColor(.red)
                }
            }
        }
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.red.opacity(0.6), lineWidth: 1)
        )
    }
}
