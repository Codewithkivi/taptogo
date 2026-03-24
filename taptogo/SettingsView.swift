//
//  ContentView.swift
//  taptogo
//
//  Created by Mac04 on 09/02/26.
//

import SwiftUI

struct SettingsView: View {
    @State private var isDarkMode = false
    @State private var notificationsEnabled = true
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(colors: [Color.blue.opacity(0.1), .white], startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                List {
                    Section {
                        HStack(spacing: 15) {
                            ZStack {
                                Circle().fill(Color.blue.opacity(0.1)).frame(width: 60, height: 60)
                                Image(systemName: "person.crop.circle.fill")
                                    .resizable()
                                    .frame(width: 60, height: 60)
                                    .foregroundColor(.blue)
                            }
                            
                            VStack(alignment: .leading, spacing: 2) {
                                Text("Dev Explorer")
                                    .font(.title3.bold())
                                Text("@dev_explorer")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                            Spacer()
                            BrandingIcon(size: 30)
                        }
                        .padding(.vertical, 8)
                    }
                    .listRowBackground(Color.white.opacity(0.7))

                   
                    Section(header: Text("Experience").font(.caption.bold())) {
                        Toggle(isOn: $isDarkMode) {
                            Label("Dark Mode", systemImage: "moon.stars.fill")
                        }
                        .tint(.blue)
                        
                        Toggle(isOn: $notificationsEnabled) {
                            Label("Notifications", systemImage: "bell.fill")
                        }
                        .tint(.blue)
                        
                        NavigationLink(destination: Text("Animations Detail")) {
                            Label("Animations", systemImage: "play.square.stack.fill")
                        }
                    }
                    .listRowBackground(Color.white.opacity(0.7))
                    .foregroundColor(.blue)

                    // 4. Account & Security Group
                    Section(header: Text("Privacy & Safety").font(.caption.bold())) {
                        NavigationLink(destination: AccountView()) {
                            Label("Account", systemImage: "person.fill")
                        }
                        NavigationLink(destination: Resetpassword()) {
                            Label("Security", systemImage: "lock.shield.fill")
                        }
                    }
                    .listRowBackground(Color.white.opacity(0.7))
                    .foregroundColor(.blue)

                    // 5. Support & About Group
                    Section(header: Text("Support").font(.caption.bold())) {
                        Label("Help Center", systemImage: "lifepreserver.fill")
                        Label("Support", systemImage: "person.2.fill")
                        Label("About Us", systemImage: "info.circle.fill")
                    }
                    .listRowBackground(Color.white.opacity(0.7))
                    .foregroundColor(.blue)
                    
                    // Logout Button
                    Section {
                        NavigationLink(destination: ContentView2()) {
                            Button(action: { /* Logout Logic */ }) {
                                Text("Logout")
                                    .frame(maxWidth: .infinity)
                                    .foregroundColor(.red)
                                    .bold()
                            }
                        }
                    }
                    .listRowBackground(Color.white.opacity(0.7))
                }
                .scrollContentBackground(.hidden) // Makes the gradient visible
                .navigationTitle("Settings")
                .navigationBarTitleDisplayMode(.large)
            }
        }
    }
}

struct BrandingIcon: View {
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
    SettingsView()
}
