//
//  Tenant.swift
//  UnitPulse BH
//
//  Created by Mac-LAB on 9/4/26.
//

import Foundation

struct Tenant: Identifiable {
    let id = UUID()
    var name: String
    var email: String
    var room: String
    var rate: Double
    var rateType: String
    var isActive: Bool
    var sinceDate: String
}

