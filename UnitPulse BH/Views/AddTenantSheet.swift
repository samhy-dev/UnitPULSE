//
//  AddTenantSheet.swift
//  UnitPulse BH
//
//  Created by Mac-LAB on 9/4/26.
//

import SwiftUI

struct AddTenantSheet: View {
    
    @ObservedObject var controller: TenantController
    @Binding var isPresented: Bool
    var editingTenant: Tenant?
    
    @State private var name = ""
    @State private var email = ""
    @State private var room = ""
    @State private var rate = ""
    @State private var rateType = "Monthly"
    
    let rateTypeOption = ["Daily", "Monthly"]
    
    var body: some View {
        VStack(spacing: 16) {
            Text(editingTenant == nil ? "Add Tenant" : "Edit Tenant")
                .font(.headline)
            
            TextField("Name", text: $name)
                .textFieldStyle(.roundedBorder)
            
            TextField("Email", text: $email)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
            
            if controller.rooms.isEmpty {
                Text("No rooms yet. Add one first using Manage Rooms.")
                    .font(.caption)
                    .foregroundColor(.gray)
            } else {
                Picker("Room", selection: $room) {
                    ForEach(controller.rooms) { r in
                        Text(r.name).tag(r.name)
                    }
                }
                .pickerStyle(.menu)
            }
            
            VStack(alignment: .leading, spacing: 6){
                
                Text("Rate Type")
                    .font(.caption)
                    .foregroundColor(.gray)
                
                Picker("Rate Type", selection: $rateType) {
                    ForEach(rateTypeOption, id: \.self) { option in
                        Text(option)
                    }
                }
                .pickerStyle(.menu)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .background(Color(.systemGray5))
                .cornerRadius(8)
            }
            
            TextField("\(rateType) Rate", text: $rate)
                .keyboardType(.decimalPad)
                .textFieldStyle(.roundedBorder)
            
            Button("Save") {
                let rateValue = Double(rate) ?? 0
                
                if let tenant = editingTenant {
                    controller.updateTenant(tenant, name: name, email: email ,room: room, rate: rateValue, rateType: rateType)
                } else {
                    controller.addTenant(name: name, email: email, room: room, rate: rateValue, rateType: rateType)
                }
                
                isPresented = false
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.black)
            .foregroundColor(.white)
            .cornerRadius(10)
            
            Spacer()
        }
        .padding()
        .onAppear {
            if let tenant = editingTenant {
                email = tenant.email
                name = tenant.name
                room = tenant.room
                rate = "\(Int(tenant.rate))"
                rateType = tenant.rateType
            } else if let firstRoom = controller.rooms.first {
                room = firstRoom.name
            }
        }
    }
}

