//
//  RoomStatusCardView.swift
//  UnitPulse BH
//
//  Created by Mac-LAB on 9/4/26.
//

import SwiftUI
struct RoomStatusCardView: View {
    
    let rooms: [RoomStatus]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("ROOM STATUS")
                .font(.caption)
                .fontWeight(.semibold)
            
            if rooms.isEmpty {
                Text("No rooms added yet")
                    .font(.caption)
                    .foregroundColor(.gray)
            } else {
                VStack(spacing: 10) {
                    ForEach(rooms) { room in
                        HStack {
                            Text(room.roomName)
                                .font(.subheadline)
                            Spacer()
                            Text(room.isOccupied ? "Occupied" : "Vacant")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .foregroundColor(room.isOccupied ? .red : .gray)
                        }
                    }
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(.systemGray5))
        .cornerRadius(12)
    }
}
