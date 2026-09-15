//
//  TenantController.swift
//  UnitPulse BH
//
//  Created by Mac-LAB on 9/4/26.
//
import Foundation
import Combine

class TenantController: ObservableObject {
    
    @Published var tenants: [Tenant] = []
    @Published var rooms: [Room] = []
    @Published var errorMessage: String? = nil
    
    func addTenant(name: String, email: String, room: String, rate: Double, rateType: String) {
        let newTenant = Tenant(name: name, email: email, room: room, rate: rate, rateType: rateType, isActive: true, sinceDate: "Sep 2026")
        tenants.append(newTenant)
    }
    
    func deleteTenant(_ tenant: Tenant) {
        tenants.removeAll { $0.id == tenant.id }
    }
    
    func updateTenant(_ tenant: Tenant, name: String, email: String, room: String, rate: Double, rateType: String) {
        if let index = tenants.firstIndex(where: { $0.id == tenant.id }) {
            tenants[index].name = name
            tenants[index].email = email
            tenants[index].room = room
            tenants[index].rate = rate
            tenants[index].rateType = rateType
        }
    }
    
    func addRoom(name: String) {
        if name.isEmpty {
            errorMessage = "Room name cannot be empty."
            return
        }
        
        if rooms.contains(where: { $0.name == name }) {
            errorMessage = "Room already exists."
            return
        }
        
        rooms.append(Room(name: name))
    }
    
    func deleteRoom(_ room: Room) {
        let isInUse = tenants.contains { $0.room == room.name }
        
        if isInUse {
            errorMessage = "Cannot delete this room, a tenant is still using it."
            return
        }
        
        rooms.removeAll { $0.id == room.id }
    }
}
