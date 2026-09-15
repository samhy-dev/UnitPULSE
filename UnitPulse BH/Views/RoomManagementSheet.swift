//
//  RoomManagementSheet.swift
//  UnitPulse BH
//
//  Created by Mac-LAB on 9/8/26.
//


import SwiftUI

struct RoomManagementSheet: View {
    
    @ObservedObject var controller: TenantController
    @Binding var isPresented: Bool
    
    @State private var newRoomName = ""
    @State private var showError = false
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Manage Rooms")
                .font(.headline)
            
            HStack {
                TextField("New room name", text: $newRoomName)
                    .textFieldStyle(.roundedBorder)
                
                Button("Add") {
                    controller.addRoom(name: newRoomName)
                    
                    if controller.errorMessage == nil {
                        newRoomName = ""
                    } else {
                        showError = true
                    }
                }
            }
            
            if controller.rooms.isEmpty {
                Text("No rooms added yet")
                    .foregroundColor(.gray)
                    .padding(.top, 20)
            } else {
                List {
                    ForEach(controller.rooms) { room in
                        HStack {
                            Text(room.name)
                            Spacer()
                            Button {
                                controller.deleteRoom(room)
                                if controller.errorMessage != nil {
                                    showError = true
                                }
                            } label: {
                                Image(systemName: "trash")
                                    .foregroundColor(.red)
                            }
                        }
                    }
                }
                .listStyle(.plain)
            }
            
            Button("Done") {
                isPresented = false
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.black)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .padding()
        .alert("Error", isPresented: $showError) {
            Button("OK") {
                controller.errorMessage = nil
            }
        } message: {
            Text(controller.errorMessage ?? "")
        }
    }
}
