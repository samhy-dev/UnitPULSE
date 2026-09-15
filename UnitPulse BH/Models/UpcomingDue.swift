//
//  UpcomingDue.swift
//  UnitPulse BH
//
//  Created by Mac-LAB on 9/3/26.
//

import Foundation

struct UpcomingDue: Identifiable {
    let id = UUID()
    var tenantName: String
    var roomName: String
    var amount: Double
    var isOverdue: Bool
    var overdueText: String
    var lastPaidDate: String
}
