//
//  TenantView.swift
//  UnitPulse BH
//
//  Created by Mac-LAB on 9/4/26.
//

import SwiftUI

struct TenantView: View {
    
    @StateObject var controller = TenantController()
    @State private var showAddForm = false
    @State private var showRoomManager = false
    @State private var tenantToEdit: Tenant? = nil
    @State private var searchText = ""
    
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
                    Text("TENANTS")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .fixedSize()
                    
                    Rectangle()
                        .frame(height: 2)
                        .foregroundColor(.black)
                }
            }
            .padding(.horizontal)
            
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                TextField("Search Name or Room", text: $searchText)
                    .fontWeight(.semibold)
            }
            .padding()
            .background(Color(.white))
            .cornerRadius(10)
            .padding(.horizontal)
            
        HStack(spacing: 12) {
            
            Button {
                tenantToEdit = nil
                showAddForm = true
            } label: {
                HStack {
                    Image(systemName: "person.fill")
                    Text("Add Tenant")
                        .fontWeight(.semibold)
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.black)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
            
            Button {
                showRoomManager = true
            } label: {
                HStack {
                    Image(systemName: "house.fill")
                    Text("Manage Rooms")
                        .fontWeight(.semibold)
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color(.white))
                .foregroundColor(.black)
                .cornerRadius(10)
            }
        }
            .padding(.horizontal)
            
            ScrollView {
                VStack(spacing: 12) {
                    if controller.tenants.isEmpty {
                        Text("No tenants added yet")
                            .foregroundColor(.black)
                            .padding(.top, 40)
                    } else {
                        ForEach(controller.tenants) { tenant in
                            if searchText.isEmpty || tenant.name.localizedCaseInsensitiveContains(searchText) || tenant.room.localizedCaseInsensitiveContains(searchText) {
                                TenantRowView(
                                    tenant: tenant,
                                    onEdit: {
                                        tenantToEdit = tenant
                                        showAddForm = true
                                    },
                                    onDelete: {
                                        controller.deleteTenant(tenant)
                                    }
                                )
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
                colors: [Color(.systemGray4), Color(.systemGray5), Color(.systemGray2)],
                    startPoint: .top,
                    endPoint: . bottom
            )
            )
        .sheet(isPresented: $showAddForm) {
            AddTenantSheet(controller: controller, isPresented: $showAddForm, editingTenant: tenantToEdit)
        }
        .sheet(isPresented: $showRoomManager) {
            RoomManagementSheet(controller: controller, isPresented: $showRoomManager)
        }
    }
}

#Preview {
    TenantView()
}
