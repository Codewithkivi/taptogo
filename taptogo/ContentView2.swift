//
//  ContentView.swift
//  taptogo
//
//  Created by Mac04 on 12/02/26.
//

import SwiftUI

var images = ["m1", "m2", "m3", "m4"]
let names = ["Goa", "Pune", "Mumbai", "Delhi"]

struct ContentView2: View {
    @State private var ispopular: Bool = false
    @StateObject private var auth = AuthViewModel()

    var body: some View {
        let transition = AnyTransition.opacity.combined(with: .scale)
        return TravelHomeView()
            .ignoresSafeArea()
            .transition(transition)
    }
}

struct TravelHomeView: View {
    @State private var searchText = ""
    @State private var selectedCategory = "Mountains"
    @State private var showNotifications = false
    @State private var showAccount = false
    let tmanu = ["Mountains", "Beaches", "Cities", "Save", "Back"]
    let cities = ["Mumbai", "Goa", "Pune", "Delhi"]
    let images = ["m1", "m2", "m3", "m4"]

    let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
    
    @State private var animateBlob = false
    @Namespace private var animation

    var body: some View {
        NavigationStack {
            ZStack {
                let backgroundGradient = LinearGradient(colors: [Color.blue.opacity(0.25), Color.cyan.opacity(0.25)], startPoint: .topLeading, endPoint: .bottomTrailing)
                backgroundGradient
                    .ignoresSafeArea()
                Circle()
                    .fill(Color.blue.opacity(0.35))
                    .blur(radius: 80)
                    .frame(width: 280, height: 280)
                    .offset(x: animateBlob ? -120 : -60, y: animateBlob ? -220 : -160)
                    .animation(.easeInOut(duration: 6).repeatForever(autoreverses: true), value: animateBlob)
                Circle()
                    .fill(Color.cyan.opacity(0.35))
                    .blur(radius: 90)
                    .frame(width: 320, height: 320)
                    .offset(x: animateBlob ? 140 : 100, y: animateBlob ? 260 : 200)
                    .animation(.easeInOut(duration: 7).repeatForever(autoreverses: true), value: animateBlob)

                List {
                    HeaderSection(showNotifications: $showNotifications, showAccount: $showAccount)
                    SearchSection(searchText: $searchText)
                    CategoriesSection(tmanu: tmanu, selectedCategory: $selectedCategory, animation: animation)
                    GridSection(
                        columns: columns,
                        cities: cities,
                        images: images,
                        selectedCategory: selectedCategory,
                        searchText: searchText
                    )
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
            .sheet(isPresented: $showNotifications) {
                NavigationStack { NotificationsView() }
            }
            .sheet(isPresented: $showAccount) {
                NavigationStack { AccountView() }
            }
            .onAppear { animateBlob = true }
        }
    }
}

private struct HeaderSection: View {
    @Binding var showNotifications: Bool
    @Binding var showAccount: Bool

    var body: some View {
        Section {
            VStack(alignment: .leading, spacing: 10) {
                HStack(alignment: .center, spacing: 16) {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Tap2go")
                            .font(.system(size: 34, weight: .black, design: .rounded))
                            .foregroundStyle(
                                LinearGradient(colors: [.blue, .cyan], startPoint: .leading, endPoint: .trailing)
                            )
                        Text("Explore your next island getaway")
                            .font(.callout)
                            .foregroundStyle(.secondary)
                    }
                    Spacer()
                    HStack(spacing: 10) {
                        Button { showNotifications = true } label: {
                            Image(systemName: "bell.badge.fill")
                                .font(.system(size: 16, weight: .bold))
                                .padding(10)
                                .background(.ultraThinMaterial)
                                .clipShape(Circle())
                                .shadow(color: .black.opacity(0.08), radius: 6, y: 4)
                                .foregroundColor(.blue)
                        }
                        Button { showAccount = true } label: {
                            Image(systemName: "person.crop.circle")
                                .font(.system(size: 18, weight: .semibold))
                                .padding(10)
                                .background(.ultraThinMaterial)
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
    }
}

private struct SearchSection: View {
    @Binding var searchText: String

    var body: some View {
        Section {
            HStack {
                Image(systemName: "magnifyingglass").bold()
                TextField("Search destinations...", text: $searchText)
                    .textInputAutocapitalization(.words)
                    .disableAutocorrection(true)
            }
            .padding(12)
            .background(.thinMaterial)
            .cornerRadius(14)
            .overlay(
                RoundedRectangle(cornerRadius: 14)
                    .stroke(Color.white.opacity(0.25), lineWidth: 0.5)
            )
            .shadow(color: .black.opacity(0.06), radius: 10, y: 6)
            .listRowInsets(EdgeInsets(top: 4, leading: 16, bottom: 4, trailing: 16))
            .listRowSeparator(.hidden)
            .listRowBackground(Color.clear)
        }
    }
}

private struct CategoriesSection: View {
    let tmanu: [String]
    @Binding var selectedCategory: String
    var animation: Namespace.ID

    var body: some View {
        Section {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    ForEach(tmanu, id: \.self) { cat in
                        CategoryPill(
                            title: cat,
                            isSelected: selectedCategory == cat,
                            animation: animation
                        ) {
                            withAnimation(.spring(response: 0.5, dampingFraction: 0.8)) {
                                selectedCategory = cat
                            }
                        }
                    }
                }
                .padding(.horizontal, 16)
            }
            .listRowInsets(EdgeInsets(top: 4, leading: 0, bottom: 4, trailing: 0))
            .listRowSeparator(.hidden)
            .listRowBackground(Color.clear)
        }
    }
}

private struct CategoryPill: View {
    let title: String
    let isSelected: Bool
    var animation: Namespace.ID
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.subheadline.weight(.semibold))
                .padding(.horizontal, 14)
                .padding(.vertical, 10)
                .background(
                    Group {
                        if isSelected {
                            Capsule().fill(Color.blue.gradient)
                        } else {
                            Capsule().fill(.thinMaterial)
                        }
                    }
                )
                .foregroundStyle(isSelected ? Color.white : Color.blue)
                .overlay(
                    Capsule().stroke(Color.blue.opacity(0.2), lineWidth: isSelected ? 0 : 1)
                )
                .shadow(color: isSelected ? .black.opacity(0.12) : .clear, radius: 8, y: 6)
        }
        .matchedGeometryEffect(id: title, in: animation, isSource: isSelected)
    }
}

private struct GridSection: View {
    let columns: [GridItem]
    let cities: [String]
    let images: [String]
    let selectedCategory: String
    let searchText: String

    var body: some View {
        Section {
            VStack(alignment: .leading, spacing: 12) {
                Text("Top curated for you")
                    .font(.headline)
                    .foregroundStyle(.secondary)
                    .padding(.horizontal, 16)

                LazyVGrid(columns: columns, spacing: 16) {
                    let base: [(city: String, image: String)] = {
                        switch selectedCategory.lowercased() {
                        case "mountains":
                            return [("Manali", "m1"), ("Shimla", "m2")]
                        case "beaches":
                            return [("Goa", "m2"), ("Kovalam", "m3")]
                        case "cities":
                            return [("Mumbai", "m3"), ("Delhi", "m4"), ("Pune", "m2")]
                        case "save":
                            return [("Saved Place", "m1")]
                        case "back":
                            return Array(zip(cities, images))
                        default:
                            return Array(zip(cities, images))
                        }
                    }()

                    let filtered: [(city: String, image: String)] = {
                        let query = searchText.trimmingCharacters(in: .whitespacesAndNewlines)
                        guard !query.isEmpty else { return base }
                        return base.filter { $0.city.localizedCaseInsensitiveContains(query) }
                    }()

                    ForEach(0..<filtered.count, id: \.self) { index in
                        NavigationLink(destination: Text("Detail of \(filtered[index].city)")) {
                            TravelCityCard(cityName: filtered[index].city, imageName: filtered[index].image)
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
    }
}

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
                .overlay(
                    LinearGradient(colors: [.clear, .black.opacity(0.85)], startPoint: .top, endPoint: .bottom)
                )
                .cornerRadius(28)
                .shadow(color: .black.opacity(0.18), radius: 18, y: 10)

            VStack(alignment: .leading, spacing: 6) {
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
        }
        .contentShape(RoundedRectangle(cornerRadius: 28, style: .continuous))
        .scaleEffect(1.0)
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

