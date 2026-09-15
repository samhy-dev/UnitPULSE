//
//  Messages.swift
//  UnitPulse BH
//
//  Created by Mac-LAB on 9/8/26.
//

import Foundation

struct Message: Identifiable {
    let id = UUID()
    var recipientName: String
    var dateSent: String
    var content: String
}

