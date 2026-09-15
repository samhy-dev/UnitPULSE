//
//  DashBoardController.swift
//  UnitPulse BH
//
//  Created by Mac-LAB on 9/3/26.
//

import Foundation
import Combine

class DashboardController: ObservableObject {
    
    @Published var rooms: [RoomStatus] = []
    @Published var upcomingDues: [UpcomingDue] = []
    
    var totalTenants: Int {
        rooms.filter { $0.isOccupied }.count
    }
    
    var totalOverdue: Int {
        upcomingDues.filter { $0.isOverdue }.count
    }
    
    var totalCollected: Double {
        0
    }
}
