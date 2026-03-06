////
////  ContentView.swift
////  taptogo
////
////  Created by Mac04 on 12/02/26.
////
//
import SwiftUI

struct AccountSettingsView: View {
    @State private var fullName: String = "Traveler Explorer"
    @State private var email: String = "traveler@islandgetaway.com"
    @State private var phoneNumber: String = "+91 98765 43210"
    
    var body: some View {
        NavigationStack {
            ZStack {
                
                LinearGradient(colors: [Color.blue.opacity(0.1), .white], startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                VStack(spacing: 25) {
                    
                   
                    VStack(spacing: 15) {
                        ZStack(alignment: .bottomTrailing) {
                            
                            Circle()
                                .fill(Color.blue.opacity(0.1))
                                .frame(width: 100, height: 100)
                                .overlay(
                                    Image(systemName: "person.fill")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 50)
                                        .foregroundColor(.blue)
                                )
                            
                           
                            AccountBrandingIcon(size: 30)
                                .offset(x: 5, y: 5)
                        }
                        
                        Text(fullName)
                            .font(.system(size: 24, weight: .black, design: .rounded))
                            .foregroundColor(.blue)
                    }
                    .padding(.top, 20)

                  
                    VStack(spacing: 1) {
                        AccountRow(icon: "person.fill", title: "Full Name", value: fullName)
                        Divider().padding(.leading, 50)
                        AccountRow(icon: "envelope.fill", title: "Email", value: email)
                        Divider().padding(.leading, 50)
                        AccountRow(icon: "phone.fill", title: "Phone", value: phoneNumber)
                        Divider().padding(.leading, 50)
                        AccountRow(icon: "mappin.and.ellipse", title: "Location", value: "Goa, India")
                    }
                    .background(Color.white.opacity(0.8))
                    .cornerRadius(20)
                    .padding(.horizontal)
                    .shadow(color: .black.opacity(0.03), radius: 10, y: 5)

                    
                    VStack(spacing: 15) {
                        Button(action: {}) {
                            Text("Edit Profile")
                                .font(.headline)
                                .frame(maxWidth: .infinity)
                                .frame(height: 55)
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(18)
                        }
                        
                        Button(action: {  }) {
                            Text("Delete Account")
                                .font(.subheadline.bold())
                                .foregroundColor(.red.opacity(0.8))
                        }
                    }
                    .padding(.horizontal, 25)
                    .padding(.top, 10)
                    
                    Spacer()
                }
            }
            .navigationTitle("Account Settings")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}



struct AccountRow: View {
    let icon: String
    let title: String
    let value: String
    
    var body: some View {
        HStack(spacing: 15) {
            Image(systemName: icon)
                .foregroundColor(.blue)
                .frame(width: 30)
            
            VStack(alignment: .leading) {
                Text(title)
                    .font(.caption.bold())
                    .foregroundColor(.secondary)
                Text(value)
                    .font(.body.bold())
                    .foregroundColor(.blue)
            }
            Spacer()
            Image(systemName: "chevron.right")
                .font(.caption.bold())
                .foregroundColor(.gray.opacity(0.5))
        }
        .padding()
    }
}


struct AccountBrandingIcon: View {
    let size: CGFloat
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.black)
                .frame(width: size, height: size)
            Image(systemName: "plus")
                .font(.system(size: size * 0.5, weight: .bold))
                .foregroundColor(.white)
        }
    }
}

#Preview {
    ContentView2()
}

