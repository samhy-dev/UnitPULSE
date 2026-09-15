//
//  SendNotificationSheet.swift
//  UnitPulse BH
//
//  Created by Mac-LAB on 9/8/26.
//

import SwiftUI

struct SendNotificationSheet: View {
    
    @ObservedObject var controller: InboxController
    @ObservedObject var tenantController: TenantController
    @Binding var isPresented: Bool
    
    @State private var recipientName = ""
    @State private var recipientEmail = ""
    @State private var content = ""
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Send Notification")
                .font(.headline)
            
            if tenantController.tenants.isEmpty {
                Text("No tenants yet. Add one first in the Tenant screen.")
                    .font(.caption)
                    .foregroundColor(.gray)
            } else {
                VStack(alignment: .leading, spacing: 6) {
                    Text("Recipient")
                        .font(.caption)
                        .foregroundColor(.gray)
                    
                    Menu {
                        ForEach(tenantController.tenants) { tenant in
                            Button(tenant.name) {
                                recipientName = tenant.name
                                recipientEmail = tenant.email
                            }
                        }
                    } label: {
                        HStack {
                            Text(recipientName.isEmpty ? "Select Tenant" : recipientName)
                                .foregroundColor(.black)
                            Spacer()
                            Image(systemName: "chevron.down")
                                .foregroundColor(.gray)
                        }
                        .padding()
                        .background(Color(.systemGray5))
                        .cornerRadius(8)
                    }
                    
                    if !recipientEmail.isEmpty {
                        Text(recipientEmail)
                            .font(.caption2)
                            .foregroundColor(.gray)
                    }
                }
            }
            
            TextField("Message", text: $content)
                .textFieldStyle(.roundedBorder)
            
            Button("Send") {
                controller.sendNotification(to: recipientName, content: content)
                isPresented = false
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.black)
            .foregroundColor(.white)
            .cornerRadius(10)
            .disabled(recipientName.isEmpty || content.isEmpty)
            
            Spacer()
        }
        .padding()
        .onAppear {
            if let firstTenant = tenantController.tenants.first {
                recipientName = firstTenant.name
                recipientEmail = firstTenant.email
            }
        }
    }
}
