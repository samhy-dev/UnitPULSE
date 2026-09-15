//
//  PaymentView.swift
//  UnitPulse BH
//
//  Created by Mac-LAB on 9/8/26.
//

import SwiftUI

struct PaymentView: View {
    
    @ObservedObject var controller = PaymentController()
    @ObservedObject var tenantController: TenantController
    @State private var showRecordForm = false
    @State private var selectedFilter = "All"
    
    let filters = ["All", "Pending", "Paid", "Overdue"]
    
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
                     Text("PAYMENTS")
                         .font(.caption)
                         .fontWeight(.semibold)
                         .fixedSize()
                     
                     Rectangle()
                         .frame(height: 2)
                         .foregroundColor(.black)
                 }
             }
             .padding(.horizontal)
            
            Button {
                showRecordForm = true
            } label: {
                    HStack {
                        Image(systemName: "plus.circle.fill")
                        Text("Record Payment")
                            .fontWeight(.semibold)
                    }
                    .padding()
                    .background(Color.black)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
            .padding(.horizontal)
            
            HStack {
                ForEach(filters, id: \.self) { filter in
                    Button {
                        selectedFilter = filter
                    } label: {
                        Text(filter)
                            .font(.caption)
                            .fontWeight(.semibold)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 6)
                            .background(selectedFilter == filter ? Color.black : Color(.white))
                            .foregroundColor(selectedFilter == filter ? .white : .black)
                            .cornerRadius(16)
                    }
                }
            }
            .padding(.horizontal)
            
            ScrollView {
                VStack(spacing: 12) {
                    if controller.payments.isEmpty {
                        Text("No payments recorded yet")
                            .foregroundColor(.black)
                            .padding(.top, 40)
                    } else {
                        ForEach(controller.payments) { payment in
                            if selectedFilter == "All" || payment.status == selectedFilter {
                                PaymentRowView(payment: payment)
                            }
                        }
                    }
                }
                .padding(.horizontal)
            }
        }
        .padding(.top)
        .background(
            LinearGradient(
                colors: [Color(.systemGray3), Color(.systemGray6), Color(.systemGray2)],
                    startPoint: .top,
                    endPoint: . bottom
            )
            )
        .sheet(isPresented: $showRecordForm) {
            RecordPaymentSheet(controller: controller, tenantController: tenantController, isPresented: $showRecordForm)
        }
    }
}

#Preview {
    PaymentView(controller: PaymentController(), tenantController: TenantController())
}

