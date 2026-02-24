//
//  ContentView.swift
//  taptogo
//
//  Created by Mac04 on 09/02/26.
//

import SwiftUI

var imagess = ["m1", "m2", "m3", "m4"]
let namess = ["Goa", "Pune", "Mumbai", "Delhi"]

struct SearchPage: View {
    let columns = [
        GridItem(.flexible(), spacing: 15),
        GridItem(.flexible(), spacing: 15),
    ]
    
    var body: some View {
        NavigationStack {
            ZStack {
                // 1. Theme-matching Background
                Color.gray.opacity(0.05).ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 25) {
                        
                        // 2. Fantastic Header (Matching your image)
                        HStack(alignment: .top, spacing: 15) {
                            Image(systemName: "globe.americas.fill")
                                .font(.system(size: 60))
                                .foregroundColor(.blue)
                                .shadow(color: .blue.opacity(0.3), radius: 10)
                            
                            VStack(alignment: .leading, spacing: 0) {
                                Text("Explore")
                                    .foregroundColor(.blue)
                                    .font(.system(size: 32, weight: .black, design: .rounded))
                                Text("Your Next\nIsland Getaway")
                                    .font(.system(size: 32, weight: .black, design: .rounded))
                                    .lineLimit(2)
                            }
                        }
                        .padding(.horizontal)
                        .padding(.top, 20)

                        Text("Top destinations curated for you")
                            .font(.subheadline.bold())
                            .foregroundColor(.secondary)
                            .padding(.horizontal)

                        // 3. Properly Aligned Grid (City matches Image)
                        LazyVGrid(columns: columns, spacing: 20) {
                            ForEach(0..<imagess.count, id: \.self) { index in
                                ZStack(alignment: .bottomLeading) {
                                    // High-End Portrait Image
                                    Image(imagess[index])
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 175, height: 260) // Taller for premium feel
                                        .clipped()
                                        .cornerRadius(30)
                                        .shadow(color: .black.opacity(0.15), radius: 15, y: 10)
                                    
                                    // Info Card with Gradient Overlay
                                    VStack(alignment: .leading, spacing: 4) {
                                        HStack {
                                            Text(namess[index]) // FIXED: Correctly aligned by index
                                                .font(.headline)
                                            Spacer()
                                            // Blue Arrow from your image
                                            Image(systemName: "arrow.right.circle.fill")
                                                .font(.title2)
                                                .foregroundColor(.blue)
                                        }
                                        
                                        Text("The city of beaches")
                                            .font(.caption2.bold())
                                            .opacity(0.9)
                                        
                                        HStack(spacing: 4) {
                                            Image(systemName: "star.fill")
                                                .font(.system(size: 10))
                                                .foregroundColor(.yellow)
                                            Text("4.5").font(.caption.bold())
                                        }
                                    }
                                    .padding(18)
                                    .foregroundColor(.white)
                                    .frame(width: 175)
                                    .background(
                                        LinearGradient(colors: [.clear, .black.opacity(0.8)],
                                                       startPoint: .top, endPoint: .bottom)
                                            .cornerRadius(30)
                                    )
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                    .padding(.bottom, 30)
                }
            }
        }
    }
}


#Preview {
    SearchPage()
}
