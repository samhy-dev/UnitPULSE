//
//  TenantRowView.swift
//  UnitPulse BH
//
//  Created by Mac-LAB on 9/4/26.
//


import SwiftUI

struct TenantRowView: View {
    
    let tenant: Tenant
    var onEdit: () -> Void
    var onDelete: () -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            
            HStack {
                Image(systemName: "person.crop.circle")
                    .font(.title2)
                
                VStack(alignment: .leading) {
                    Text(tenant.name)
                        .fontWeight(.semibold)
                    Text(tenant.email)
                        .font(.caption2)
                        .foregroundColor(.gray)
                    Text(tenant.room)
                        .font(.caption)
                        .foregroundColor(.gray)
                    Text("Since \(tenant.sinceDate)")
                        .font(.caption2)
                        .foregroundColor(.gray)
                    Text("\(tenant.rateType) ₱\(Int(tenant.rate))")
                        .font(.caption2)
                        .foregroundColor(.gray)
                }
                
                Spacer()
                
                Text(tenant.isActive ? "Active" : "Overdue")
                    .font(.caption)
                    .fontWeight(.semibold)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 4)
                    .background(tenant.isActive ? Color.green : Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(12)
            }
            
            HStack {
                Button(action: onEdit) {
                    HStack {
                        Image(systemName: "pencil")
                        Text("Edit")
                    }
                    .font(.caption)
                    .frame(maxWidth: .infinity)
                    .padding(8)
                    .background(Color(.systemGray5))
                    .foregroundColor(.black)
                    .cornerRadius(8)
                }
                
                Button(action: onDelete) {
                    Image(systemName: "trash")
                        .foregroundColor(.white)
                        .padding(8)
                        .background(Color.red)
                        .cornerRadius(8)
                }
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 2)
    }
}
