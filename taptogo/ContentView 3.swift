//
//  ContentView.swift
//  taptogo
//
//  Created by Mac04 on 09/02/26.
//

import SwiftUI

struct ContentView3: View {
    @State private var ispopular: Bool = false
    @State private var ispopulars: Bool = false
    let columns = [
        GridItem(.flexible(minimum: 100, maximum: .infinity), spacing: 2),
        GridItem(.flexible(minimum: 100, maximum: .infinity), spacing: 2),
    ]
    var body: some View {
        
        NavigationStack {
            List {
                // Themed header
                ZStack(alignment: .leading) {
                    HStack(spacing: 12) {
                        Image(systemName: "chevron.left")
                            .font(.title3.weight(.semibold))
                            .foregroundStyle(.black)
                            .padding(8)
                            .background(.white.opacity(0.15), in: Circle())
                        Text("Goa, India")
                            .font(.title2.weight(.bold))
                            .foregroundStyle(.white)
                        Spacer()
                    }
                    .padding(.horizontal)
                    .padding(.top, 8)
                }
                .listRowInsets(EdgeInsets())
                .listRowSeparator(.hidden)

                // Hero image with overlay
                ZStack(alignment: .bottomLeading) {
                    Image("m2")
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: .infinity, minHeight: 220, maxHeight: 260)
                        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                    LinearGradient(colors: [.black.opacity(0.0), .black.opacity(0.5)], startPoint: .center, endPoint: .bottom)
                        .frame(height: 120)
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Goa, India")
                            .font(.headline)
                            .foregroundStyle(.white)
                        Text("A beautiful beach destination")
                            .font(.subheadline)
                            .foregroundStyle(.white.opacity(0.9))
                    }
                    .padding()
                }
                .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 6)
                .listRowInsets(EdgeInsets())
                .listRowSeparator(.hidden)

                // Rating + Map button row
                HStack(spacing: 12) {
                    Label {
                        HStack(spacing: 4) {
                            Text("4.8").font(.body.weight(.semibold)).foregroundStyle(.primary)
                            Text("(1,200 reviews)").font(.subheadline).foregroundStyle(.secondary)
                        }
                    } icon: {
                        Image(systemName: "star.fill")
                            .foregroundStyle(.yellow)
                    }
                    Spacer()
                    Button {
                        // Map action here
                    } label: {
                        Label("Map View", systemImage: "map")
                            .font(.subheadline.weight(.semibold))
                            .padding(.horizontal, 14)
                            .padding(.vertical, 8)
                            .background(Theme.pillBackground(), in: Capsule())
                            .foregroundStyle(.white)
                    }
                    .buttonStyle(.plain)
                }
                .listRowSeparator(.hidden)

                // Description
                Text("Explore the best of Goa here and more! Enjoy the beaches, nightlife, and many more experiences.")
                    .font(.body)
                    .foregroundStyle(.secondary)
                    .listRowSeparator(.hidden)

                // Primary actions
                HStack(spacing: 12) {
                    Button {
                        ispopular.toggle()
                    } label: {
                        Label("Save", systemImage: "heart.fill")
                            .font(.body.weight(.semibold))
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 12)
                            .background(Theme.pillBackground(), in: Capsule())
                            .overlay {
                                if ispopular {
                                    Capsule().stroke(Color.red.opacity(0.6), lineWidth: 2)
                                }
                            }
                    }
                    .buttonStyle(.plain)

                    Button {
                        ispopulars.toggle()
                    } label: {
                        Label("Directions", systemImage: "location.fill")
                            .font(.body.weight(.semibold))
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 12)
                            .background(Theme.pillBackground(), in: Capsule())
                            .overlay {
                                if ispopulars {
                                    Capsule().stroke(Color.green.opacity(0.6), lineWidth: 2)
                                }
                            }
                    }
                    .buttonStyle(.plain)
                }
                .listRowSeparator(.hidden)

                // Reviews (reusable rows)
                ReviewRow(title: "Amazing place!", rating: 4.5)
                ReviewRow(title: "Loved the vibe!", rating: 4.5)
                ReviewRow(title: "Amazing!", rating: 4.5)
            }
            .listStyle(.plain)
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
            .background(Color(.systemBackground))
        }
    }
}

struct ReviewRow: View {
    let title: String
    let rating: Double

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 14, style: .continuous)
                .fill(.ultraThinMaterial)
            HStack(alignment: .top, spacing: 12) {
                VStack(alignment: .center, spacing: 6) {
                    Image(systemName: "person.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 28, height: 28)
                        .foregroundStyle(.secondary)
                    Text("Review")
                        .font(.caption2)
                        .foregroundStyle(.secondary)
                }

                VStack(alignment: .leading, spacing: 6) {
                    HStack {
                        Text(title)
                            .font(.body.weight(.semibold))
                            .foregroundStyle(.primary)
                        Spacer()
                        Text(String(format: "%.1f", rating))
                            .font(.callout.weight(.semibold))
                            .foregroundStyle(.primary)
                        HStack(spacing: 2) {
                            ForEach(0..<4, id: \.self) { _ in
                                Image(systemName: "star.fill").foregroundStyle(.yellow)
                            }
                        }
                    }
                }
            }
            .padding(12)
        }
        .listRowSeparator(.hidden)
    }
}


#Preview {
    ContentView3()
}
