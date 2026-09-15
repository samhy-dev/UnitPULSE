//
//  Payment.swift
//  UnitPulse BH
//
//  Created by Mac-LAB on 9/8/26.
//

import Foundation

struct Payment: Identifiable {
    let id = UUID()
    var tenantName: String
    var dueDate: String
    var modeOfPayment: String
    var amount: Double
    var status: String
}

