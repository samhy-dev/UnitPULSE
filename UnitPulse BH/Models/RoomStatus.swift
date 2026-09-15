

//
//  RoomStatus.swift
//  UnitPulse BH
//
//  Created by Mac-LAB on 9/3/26.
//

import Foundation

struct RoomStatus : Identifiable {
    let id = UUID()
    var roomName: String
    var isOccupied: Bool
    
    var statusText: String {
        isOccupied ? "Occupied" : "Vacant"
    }
}
