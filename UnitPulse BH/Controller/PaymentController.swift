//
//  PaymentController.swift
//  UnitPulse BH
//
//  Created by Mac-LAB on 9/8/26.
//

import Foundation
import Combine

class PaymentController: ObservableObject {
    
    @Published var payments: [Payment] = []
    
    func recordPayment(tenantName: String, dueDate: String, mode: String, amount: Double, status: String) {
        let newPayment = Payment(tenantName: tenantName, dueDate: dueDate, modeOfPayment: mode, amount: amount, status: status)
        payments.append(newPayment)
    }
    
}
