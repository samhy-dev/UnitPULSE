//
//  ContentView.swift
//  UnitPulse BH
//
//  Created by Mac-LAB on 9/4/26.
//


import SwiftUI

struct ContentView: View {
    
    @StateObject var tenantController = TenantController()
    @StateObject var paymentController = PaymentController()
    @State private var showSplash = true
    
    var body: some View {
        if showSplash {
            SplashView(showSplash: $showSplash)
                .transition(.opacity)
        }else{
            
            TabView{
                
                DashboardView(tenantController: tenantController, paymentController: paymentController)
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("Home")
                    }
                
                TenantView(controller: tenantController)
                    .tabItem {
                        Image(systemName: "person.2.fill")
                        Text("Tenant")
                    }
                
                PaymentView(controller: paymentController, tenantController: tenantController)
                    .tabItem {
                        Image(systemName: "creditcard.fill")
                        Text("Payment")
                    }
                
                InboxView(tenantController: tenantController)
                    .tabItem {
                        Image(systemName: "envelope.fill")
                        Text("Inbox")
                    }
                
            }
        }
    }
    
}
#Preview {
    ContentView()
    
}
