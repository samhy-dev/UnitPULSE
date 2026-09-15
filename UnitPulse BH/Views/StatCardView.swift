//
//  StartCardView.swift
//  UnitPulse BH
//
//  Created by Mac-LAB on 9/4/26.
//

import SwiftUI

struct StatCardView: View {
    
    let title: String
    let value: String
    let icon: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.caption)
                .fontWeight(.semibold)
            Spacer()
            HStack {
                Text(value)
                    .font(.headline)
                Spacer()
                Image(systemName: icon)
            }
        }
        .padding()
        .frame(height: 90)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(.systemGray5))
        .cornerRadius(12)
    }
}
