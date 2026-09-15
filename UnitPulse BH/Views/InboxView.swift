//
//  InboxView.swift
//  UnitPulse BH
//
//  Created by Mac-LAB on 9/8/26.
//

import SwiftUI

struct InboxView: View {
    
    @StateObject var controller = InboxController()
    @ObservedObject var tenantController: TenantController
    @State private var showSendForm = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            
            VStack(alignment: .center, spacing: 8) {
                HStack {
                    Spacer()
                }
                
                VStack(alignment: .leading, spacing: 0) {
                    Text("Boarding House")
                        .font(.caption)
                        .foregroundColor(.black)
                    Text("UnitPULSE")
                        .font(.system(size: 28, weight: .bold))
                }
                
                HStack(spacing: 8) {
                     Text("INBOX")
                         .font(.caption)
                         .fontWeight(.semibold)
                         .fixedSize()
                     
                     Rectangle()
                         .frame(height: 2)
                         .foregroundColor(.black)
                 }
             }
             .padding(.horizontal)
            
            Text("Recent Message Sent")
                .font(.caption)
                .fontWeight(.semibold)
                .padding(.horizontal)
            
            ScrollView {
                VStack(spacing: 12) {
                    if controller.messages.isEmpty {
                        Text("No messages sent yet")
                            .foregroundColor(.black)
                            .padding(.top, 40)
                    } else {
                        ForEach(controller.messages) { message in
                            MessageCardView(message: message)
                        }
                    }
                }
                .padding(.horizontal)
            }
            
            Button {
                showSendForm = true
            } label: {
                HStack {
                    Image(systemName: "paperplane.fill")
                    Text("Send Notification")
                        .fontWeight(.semibold)
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.black)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
            .padding()
        }
        .padding(.top)
        .background(
            LinearGradient(
                colors: [Color(.systemGray3), Color(.systemGray6), Color(.systemGray2)],
                    startPoint: .top,
                    endPoint: . bottom
            )
            )
        .sheet(isPresented: $showSendForm) {
            SendNotificationSheet(controller: controller, tenantController: tenantController, isPresented: $showSendForm)
        }
    }
}

#Preview {
    InboxView(tenantController: TenantController())
}

