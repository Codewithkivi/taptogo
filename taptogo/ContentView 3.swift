//
//  ContentView.swift
//  taptogo
//
//  Created by Mac04 on 09/02/26.
//

import SwiftUI

struct ContentView3: View {
    @State private var isSaved: Bool = false
    @State private var showDirections: Bool = false
    
    // Auto-calculates safe area for different iPhone notches
    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                // Background
                Color.white.ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 16) {
                        
                        // 1. ADAPTIVE HERO HEADER
                        ZStack(alignment: .top) {
                            // Uses relative width instead of fixed numbers for resolution independence
                            Image("m2")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                            
                            // Native-style Toolbar
                            HStack {
                                Button(action: {}) {
                                    Image(systemName: "chevron.left")
                                        .font(.system(size: 18, weight: .bold))
                                        .padding(10)
                                        .background(.ultraThinMaterial)
                                        .clipShape(Circle())
                                }
                                Spacer()
                                // YOUR LOGO (Integrated as Profile/Brand)
                                ZStack {
                                    Circle().fill(.black).frame(width: 38, height: 38)
                                    Circle().stroke(.white, lineWidth: 1.5).frame(width: 32, height: 32)
                                    Image(systemName: "plus").foregroundColor(.white).font(.system(size: 14, weight: .bold))
                                }
                            }
                            .padding(.horizontal, 25)
                            .padding(.top, 15)
                            
                            // Bottom Title Overlay
                            VStack {
                                Spacer()
                                HStack(alignment: .bottom) {
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text("Goa, India")
                                            .font(.system(.title, design: .rounded, weight: .heavy))
                                        Text("Paradise of the East").font(.subheadline).bold()
                                    }
                                    Spacer()
                                    Text("$450").font(.title3.bold())
                                        .padding(.horizontal, 12).padding(.vertical, 6)
                                        .background(.black.opacity(0.7)).clipShape(Capsule())
                                }
                                .foregroundColor(.white)
                                .padding(25)
                                .background(LinearGradient(colors: [.clear, .black.opacity(0.4)], startPoint: .top, endPoint: .bottom))
                                .clipShape(RoundedRectangle(cornerRadius: 30))
                            }
                        }

                        .padding(.horizontal, 10)
                        
                        // 2. DYNAMIC INFO ROW
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 12) {
                                InfoTag(icon: "star.fill", text: "4.8", color: .orange)
                                InfoTag(icon: "clock.fill", text: "3 Days", color: .blue)
                                InfoTag(icon: "thermometer.medium", text: "28°C", color: .red)
                                InfoTag(icon: "mappin.and.ellipse", text: "Map", color: .green)
                            }
                            .padding(.horizontal, 20)
                        }

                        // 3. ADAPTIVE CONTENT SECTION
                        VStack(alignment: .leading, spacing: 12) {
                            Text("About the Destination")
                                .font(.headline).foregroundColor(.blue)
                            
                            Text("Explore the best of Goa! Enjoy sun-kissed beaches, vibrant nightlife, and architecture. Perfect for all iPhone users.")
                                .font(.callout).foregroundColor(.secondary)
                                .fixedSize(horizontal: false, vertical: true) // Prevents text cutoff
                        }
                        .padding(.horizontal, 20)

                        // 4. ACTION BUTTONS (PLATFORM NATIVE)
                        HStack(spacing: 15) {
                            NativeBtn(title: "Save", icon: "heart.fill", color: .blue, active: isSaved) { isSaved.toggle() }
                            NativeBtn(title: "Route", icon: "location.fill", color: .black, active: showDirections) { showDirections.toggle() }
                        }
                        .padding(.horizontal, 20)
                        
                        // 5. REVIEWS (FLUID LIST)
                        Text("Recent Reviews").font(.headline).padding(.horizontal, 20)
                        
                        VStack(spacing: 10) {
                            SimpleReview(user: "Aryan", text: "Stunning vibes!")
                            SimpleReview(user: "Sarah", text: "Best food ever.")
                        }
                        .padding(.horizontal, 20)
                    }
                    .padding(.top, 10)
                    .padding(.bottom, 40)
                }
            }
        }
    }
}

// MARK: - Adaptive Components

struct InfoTag: View {
    let icon: String; let text: String; let color: Color
    var body: some View {
        HStack(spacing: 5) {
            Image(systemName: icon).font(.caption)
            Text(text).font(.caption.bold())
        }
        .padding(.horizontal, 12).padding(.vertical, 8)
        .background(Color.blue.opacity(0.05))
        .cornerRadius(12)
    }
}

struct NativeBtn: View {
    let title: String; let icon: String; let color: Color; let active: Bool; let action: () -> Void
    var body: some View {
        Button(action: action) {
            Label(title, systemImage: icon)
                .font(.subheadline.bold())
                .frame(maxWidth: .infinity)
                .padding(.vertical, 14)
                .background(active ? color : color.opacity(0.8))
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius: 16))
        }
    }
}

struct SimpleReview: View {
    let user: String; let text: String
    var body: some View {
        HStack {
            Circle().fill(.blue.opacity(0.1)).frame(width: 35, height: 35)
                .overlay(Text(String(user.prefix(1))).font(.caption.bold()))
            VStack(alignment: .leading) {
                Text(user).font(.caption.bold())
                Text(text).font(.caption).foregroundColor(.secondary)
            }
            Spacer()
        }
        .padding(12).background(Color.gray.opacity(0.05)).cornerRadius(15)
    }
}




#Preview {
    ContentView3()
}
