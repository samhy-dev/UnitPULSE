//
//  PaymentRowView.swift
//  UnitPulse BH
//
//  Created by Mac-LAB on 9/8/26.
//

import SwiftUI

struct PaymentRowView: View {
    
    let payment: Payment
    
    var statusColor: Color {
        if payment.status == "Paid" {
            return .green
        } else if payment.status == "Pending" {
            return .orange
        } else {
            return .red
        }
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(payment.tenantName)
                    .fontWeight(.semibold)
                Text("Due \(payment.dueDate)")
                    .font(.caption)
                    .foregroundColor(.gray)
                Text("Mode of Payment : \(payment.modeOfPayment)")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            VStack(alignment: .trailing, spacing: 6) {
                Text(payment.status)
                    .font(.caption2)
                    .fontWeight(.semibold)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 4)
                    .background(statusColor)
                    .foregroundColor(.white)
                    .cornerRadius(12)
                
                Text("₱\(Int(payment.amount))")
                    .fontWeight(.bold)
            }
        }
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.orange.opacity(0.5), lineWidth: 1)
        )
    }
}
