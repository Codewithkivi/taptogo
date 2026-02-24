//
//  ContentView.swift
//  taptogo
//
//  Created by Mac04 on 12/02/26.
//

import SwiftUI

var images = ["m1", "m2", "m3", "m4"]
let names = ["Goa", "Pune", "Mumbai", "Delhi"]
let tmanu = ["Popular", "Mountains", "Beaches", "Cities", "Save", "Back"]

struct ContentView2: View {
    @State private var ispopular: Bool = false
    @StateObject private var auth = AuthViewModel()

    var body: some View {
//        if auth.isAuthenticated {
            TravelHomeView()
                .ignoresSafeArea()
//        } else {
//            AuthFlow(auth: auth)
//        }
    }
}

struct TravelHomeView: View {
    @State private var searchText = ""
    @State private var selectedCategory = "Popular"
    let tmanu = ["Popular", "Mountains", "Beaches", "Cities", "Islands"]
    let cities = ["Goa", "Pune", "Mumbai", "Delhi"]
    let images = ["m1", "m2", "m3", "m4"]

    let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]

    var body: some View {
        NavigationStack {
            ZStack {
                Color.gray.opacity(0.03).ignoresSafeArea()

                List {
                    // Header + Status
                    Section {
                        VStack(alignment: .leading, spacing: 8) {
                            HStack(alignment: .center, spacing: 16) {
                                VStack(alignment: .leading, spacing: 2) {
                                    Text("Tap2go")
                                        .font(.system(size: 28, weight: .black, design: .rounded))
                                        .foregroundStyle(
                                            LinearGradient(colors: [.blue, .cyan], startPoint: .leading, endPoint: .trailing)
                                        )
                                    Text("Explore your next island getaway")
                                        .font(.caption)
                                        .foregroundColor(.secondary)
                                }
                                Spacer()
                                HStack(spacing: 10) {
                                    Button(action: {}) {
                                        Image(systemName: "bell.badge.fill")
                                            .font(.system(size: 16, weight: .bold))
                                            .padding(10)
                                            .background(Color.white)
                                            .clipShape(Circle())
                                            .shadow(color: .black.opacity(0.08), radius: 6, y: 4)
                                            .foregroundColor(.blue)
                                    }
                                    Button(action: {}) {
                                        Image(systemName: "person.crop.circle")
                                            .font(.system(size: 18, weight: .semibold))
                                            .padding(10)
                                            .background(Color.white)
                                            .clipShape(Circle())
                                            .shadow(color: .black.opacity(0.08), radius: 6, y: 4)
                                            .foregroundColor(.blue)
                                    }
                                }
                            }
                        }
                        .listRowInsets(EdgeInsets(top: 12, leading: 16, bottom: 4, trailing: 16))
                        .listRowSeparator(.hidden)
                        .listRowBackground(Color.clear)
                    }

                    // Search
                    Section {
                        HStack {
                            Image(systemName: "magnifyingglass").bold()
                            TextField("Search destinations...", text: $searchText)
                        }
                        .padding(12)
                        .background(Color.white)
                        .cornerRadius(12)
                        .shadow(color: .black.opacity(0.05), radius: 8, y: 4)
                        .listRowInsets(EdgeInsets(top: 4, leading: 16, bottom: 4, trailing: 16))
                        .listRowSeparator(.hidden)
                        .listRowBackground(Color.clear)
                    }

                  
                    // Grid
                    Section {
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Top curated for you")
                                .font(.headline)
                                .foregroundColor(.secondary)
                                .padding(.horizontal, 16)

                            LazyVGrid(columns: columns, spacing: 16) {
                                ForEach(0..<images.count, id: \.self) { index in
                                    NavigationLink(destination: Text("Detail of \(cities[index])")) {
                                        TravelCityCard(cityName: cities[index], imageName: images[index])
                                    }
                                }
                            }
                            .padding(.horizontal, 16)
                            .padding(.bottom, 4)
                        }
                        .listRowInsets(EdgeInsets())
                        .listRowSeparator(.hidden)
                        .listRowBackground(Color.clear)
                    }
                   
                    // Categories (Wide grid)
                    Section {
                        Spacer()
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Browse by category")
                                .font(.title3.bold())
                                .padding(.horizontal, 16)

                            LazyVGrid(columns: [
                                GridItem(.flexible(), spacing: 16),
                            ], spacing: 16) {
                                ForEach(tmanu, id: \.self) { cat in
                                    CategoryCard(title: cat, isSelected: selectedCategory == cat)
                                        .onTapGesture { selectedCategory = cat }
                                }
                            }
                            .padding(.horizontal, 16)
                            .padding(.bottom, 4)
                        }
                        .listRowInsets(EdgeInsets())
                        .listRowSeparator(.hidden)
                        .listRowBackground(Color.clear)
                    }

                }
                .listStyle(.plain)
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: { /* auth.logout() */ }) {
                        Image(systemName: "rectangle.portrait.and.arrow.right")
                            .foregroundColor(.red)
                    }
                }
            }
        }
    }
}

// MARK: - Card
struct TravelCityCard: View {
    let cityName: String
    let imageName: String

    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 175, height: 260)
                .clipped()
                .cornerRadius(30)
                .shadow(color: .black.opacity(0.15), radius: 15, y: 10)

            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Text(cityName)
                        .font(.headline)
                    Spacer()
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
                LinearGradient(colors: [.clear, .black.opacity(0.8)], startPoint: .top, endPoint: .bottom)
                    .cornerRadius(30)
            )
        }
    }
}

struct CategoryCard: View {
    let title: String
    let isSelected: Bool

    var body: some View {
        ZStack(alignment: .bottomLeading) {
            // Background gradient and subtle pattern
            RoundedRectangle(cornerRadius: 18, style: .continuous)
                .fill(
                    LinearGradient(colors: isSelected ? [.blue, .cyan] : [.white, .white], startPoint: .topLeading, endPoint: .bottomTrailing)
                )
                .shadow(color: .black.opacity(0.08), radius: 10, y: 6)
                .overlay(
                    RoundedRectangle(cornerRadius: 18, style: .continuous)
                        .stroke(isSelected ? Color.clear : Color.blue.opacity(0.15), lineWidth: 1)
                )

            VStack(alignment: .leading, spacing: 8) {
                HStack(spacing: 10) {
                    Image(systemName: icon(for: title))
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(isSelected ? .white : .blue)
                        .padding(10)
                        .background(
                            Circle().fill(isSelected ? Color.white.opacity(0.2) : Color.blue.opacity(0.08))
                        )
                    Spacer()
                    Image(systemName: "chevron.right")
                        .font(.headline)
                        .foregroundColor(isSelected ? .white.opacity(0.9) : .blue.opacity(0.6))
                }

                Text(title)
                    .font(.system(size: 22, weight: .heavy, design: .rounded))
                    .foregroundColor(isSelected ? .white : .blue)

                Text(subtitle(for: title))
                    .font(.caption)
                    .foregroundColor(isSelected ? .white.opacity(0.9) : .secondary)
            }
            .padding(16)
        }
        .frame(height: 110)
    }

    private func icon(for title: String) -> String {
        switch title.lowercased() {
        case "popular": return "flame.fill"
        case "mountains": return "mountain.2.fill"
        case "beaches": return "sun.max.fill"
        case "cities": return "building.2.fill"
        case "save": return "bookmark.fill"
        case "back": return "arrow.uturn.left.circle.fill"
        default: return "globe.asia.australia.fill"
        }
    }

    private func subtitle(for title: String) -> String {
        switch title.lowercased() {
        case "popular": return "Trending destinations"
        case "mountains": return "Hike the peaks"
        case "beaches": return "Sun, sand & surf"
        case "cities": return "Urban discoveries"
        case "save": return "Your saved places"
        case "back": return "Return to previous"
        default: return "Explore more"
        }
    }
}

#Preview {
    ContentView2()
}

