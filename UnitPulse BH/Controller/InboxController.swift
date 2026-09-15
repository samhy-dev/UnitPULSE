//
//  InboxController.swift
//  UnitPulse BH
//
//  Created by Mac-LAB on 9/8/26.
//

import Foundation
import Combine

class InboxController: ObservableObject {
    
    @Published var messages: [Message] = []
    
    func sendNotification(to name: String, content: String) {
        let newMessage = Message(recipientName: name, dateSent: "September 03 2026", content: content)
        messages.insert(newMessage, at: 0)
    }
}
